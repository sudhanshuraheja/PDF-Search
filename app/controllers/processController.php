<?php

	/*
		You can do the following in the controller

		1. TO DISPLAY ERRORS :
				display_error("Calls to the function <strong>display_error($message)</strong> are displayed like this");
				display_warning("Calls to the function <strong>display_warning($message)</strong> are displayed like this");
				display_system("Calls to the function <strong>display_system($message)</strong> are displayed like this");
				display("Calls to the function <strong>display($message)</strong> are displayed like this");

		2. TO HANDLE DATABASES :
				If you have the following table
				CREATE TABLE IF NOT EXISTS `students` (
					`id` int(11) NOT NULL auto_increment,
					`name` varchar(64) NOT NULL,
					`phone` varchar(64) NOT NULL,
					`status` varchar(128) NOT NULL,
				PRIMARY KEY  (`id`)
				) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

				Then run php index.php generatrix preparedb

				This would create a class students and you can run
				$students = new students($this->getDb());
				$students_data = $students->select("*", "WHERE id=5");
				$students_data = $students->delete("WHERE id=5");
				$students_data = $students->update(array("name" => "sudhanshu"), "WHERE id=5");
				$students_data = $students->insert(array("name" => "sudhanshu", "phone" => "1234567890", "status" => "working on generatrix"));

		3. TO PASS VALUES TO THE VIEW :
				$this->set("sample", "This is sample content which was set in the controller");
				$this->set("students_data", $students_data);
	*/

	class processController extends Controller {

		public function base() {

		}

  	private function sanitize($term) {
    	return preg_replace('/-+/', '-', trim(preg_replace('/[^a-zA-Z0-9\.]/', '-', trim($term) ) ) );
  	}

		private function getFileName($name) {
			return substr($name, 0, strlen($name) - 4);
		}

		private function getFileType($name) {
			return substr($name, -3);
		}

		private function readFile($file_name) {
			if(file_exists(BOOKS_PATH . $file_name)) {
				if($fp = fopen(BOOKS_PATH . $file_name, "r")) {
					$data = '';
					while(!feof($fp)) {
						$data .= fgets($fp);
					}
					fclose($fp);
					return $data;
				} else {
					display_error('The file <strong>' . BOOKS_PATH . $file_name . '</strong> could not be opened');
					return false;
				}
			} else {
				display_error('The file <strong>' . BOOKS_PATH . $file_name . '</strong> does not exist');
				return false;
			}
		}

		public function downloadFiles() {
			$present_working_directory = getcwd();
			chdir(BOOKS_PATH);
			$file = new files($this->getDb());
			$download = $file->select('*', 'WHERE downloaded=0 AND approved=1 ORDER BY id');
			foreach($download as $dl) {
				if(!file_exists(BOOKS_PATH . $dl['name'])) {
					exec(escapeshellcmd('wget ' . $dl['link']));
				}
			}
			chdir($present_working_directory);
		}

		public function createText() {
			$present_working_directory = getcwd();
			chdir(BOOKS_PATH);
			if(is_dir(BOOKS_PATH)) {
				if($directory = opendir(BOOKS_PATH)) {
					while(($file = readdir($directory)) !== false) {
						if(
							(filetype(BOOKS_PATH . $file) == 'file') &&
							($this->getFileType($file) == 'pdf')
						)
						 {
							$new_file_name = $this->getFileName($this->sanitize($file));
							if($new_file_name != $file) {
								rename(BOOKS_PATH . $file, BOOKS_PATH . $new_file_name . '.pdf');
								$db_file = new files($this->getDb());
								$db_file->update(array(
									'name' => $new_file_name . '.pdf'
								), 'WHERE name="' . $file . '"');
							}
							if(!file_exists($new_file_name . '.txt')) {
								exec(escapeshellcmd('pdftotext -nopgbrk ' . $new_file_name . '.pdf ' . $new_file_name . '.txt'));
							}
						}
					}
				}
			} else {
				display_error('Directory ' . BOOKS_PATH . ' does not exist');
			}
			chdir($present_working_directory);
		}

  	private function sanitizeWithSpace($term) {
			$term = nl2br($term);
			$term = strtolower(str_replace('<br />', '', $term));
    	return preg_replace('/\s+/', ' ', trim(preg_replace('/[^a-zA-Z0-9\.]/', ' ', trim($term) ) ) );
  	}

		private function getIgnoredWords() {
			return array('the', 'and', 'to', 'of', 'a', 'in', 'is', 'it', 'on', 'for', 'that', 's', 'ar', 'or', 'as', 'be', 'e', 'by', 'can', 't', 'i', 'an', 'n', 'm');
		}

		public function createIndexes() {
			if(is_dir(BOOKS_PATH)) {
				if($directory = opendir(BOOKS_PATH)) {
					while(($file = readdir($directory)) !== false) {
						$file_id = $this->getFileId($this->getFileName($file));
						display($file);

						if(
							($file_id != '') &&
							(filetype(BOOKS_PATH . $file) == 'file') &&
							($this->getFileType($file) == 'txt') &&
							(!$this->areIndexesDefined($file_id))
						) {

							$data = $this->readFile($file);
							$data = $this->sanitizeWithSpace($data);
							$indexes = str_word_count($data, 1, '0123456789');

							$total_count = 0;
							$index_count = array();
							$stemmer = new PorterStemmer();
							foreach($indexes as $index) {
								$word = $stemmer->Stem($index);
								if(!in_array($word, $this->getIgnoredWords())) {
									$word = 'indx-' . $word;
									if(!isset($index_count[$word])) {
										$index_count[$word] = 1;
									} else {
										$index_count[$word]++;
									}
									$total_count++;
								}
							}
							arsort($index_count);
							$this->saveIndexes($file_id, $index_count, $total_count);
						}
					}
				}
			}
		}

		private function getFileId($file_name) {
			if($file_name == '')
				return;

			$file = new files($this->getDb());

			$file_id = false;
			$files = $file->select('*', 'WHERE name="' . $file_name . '" OR name="' . $file_name . '.pdf" ');
			if(!isset($files[0]['id'])) {
				$id_array = $file->insert(array(
					'name' => $file_name,
					'approved' => 1,
					'downloaded' => 1,
					'created' => time()
				));
				$file_id = $id_array[0][1];
			} else {
				$file_id = $files[0]['id'];
			}
			return $file_id;
		}

		private function areIndexesDefined($file_id) {
			$index = new indexes($this->getDb());
			$indexes = $index->select('*', 'WHERE file="' . $file_id . '"');
			if(!isset($indexes[0]['id'])) {
				return false;
			} else {
				return true;
			}
		}

		private function saveIndexes($file_id, $index_count, $total_count) {
			$index = new indexes($this->getDb());

			foreach($index_count as $name => $count) {
				$wpm = floor(1000000 * ($count / $total_count));
				$index->insert(array(
					'file' => $file_id,
					'stem' => $name,
					'count' => $count,
					'wpm' => $wpm
				));
				//display('Inserted ' . $file_id . ' -- ' . $name . ' -- ' . $count . ' -- ' . $wpm);
			}
		}
	}

?>
