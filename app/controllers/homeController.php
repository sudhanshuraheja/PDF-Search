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

	class homeController extends Controller {

		public function base() {
			$results = array();
			$query = isset($_GET['q']) ? $_GET['q'] : false;

			$search = $query;

			if($query !== false) {
				$stemmer = new PorterStemmer();
				$index = new indexes($this->getDb());
				$file = new files($this->getDb());

				$scores = array();
				$terms = explode(' ', $query);

				$db_searches = new searches($this->getDb());
				foreach($terms as $term) {
					if($term != '') {
						$old = $db_searches->select('*', 'WHERE term="'  . $term . '"');
						if(isset($old[0]['id'])) {
							$db_searches->update(array(
								'count' => ++$old[0]['count'],
								'date' => time()
							), 'WHERE term="' . $term . '"');
						} else {
							$db_searches->insert(array(
								'term' => $term,
								'count' => 1,
								'date' => time()
							));
						}
					}
				}

				$term_weight = 0.1;
				$wpm_weight = 7;
				$count_weight = 135;

				$count = 0;
				foreach($terms as $term) {
					$term = 'indx-' . $stemmer->Stem($term);
					$data = $index->select('*', 'WHERE stem="' . $term . '" ORDER BY wpm DESC, count DESC');
					foreach($data as $file_data) {
						$file_id = $file_data['file'];
						$wpm = $file_data['wpm'];
						$index_count = $file_data['count'];

						$weight = ($wpm * $wpm_weight * (1 - ($term_weight * $count))) + ($index_count * $count_weight * (1 - ($term_weight * $count)));
						if(isset($scores[$file_id])) {
							$scores[$file_id] += $weight;
						} else {
							$scores[$file_id] = $weight;
						}
					}
					$count++;
				}
				arsort($scores);

				foreach($scores as $key => $score) {
					$results[$key] = array();
					$results[$key]['score'] = $score;
				}

				$ids = array_keys($scores);
				$files = array();
				if(count($ids) > 0) {
					$files = $file->select('*', 'WHERE id IN (' . implode(', ', $ids) . ')');
				}
				foreach($files as $selected) {
					$results[$selected['id']]['id'] = $selected['id'];
					$results[$selected['id']]['name'] = $selected['name'];
					$results[$selected['id']]['link'] = $selected['link'];
				}

				$this->set('results', $results);
			} else {
				$this->set('results', $results);
			}
			$this->set('search', $search);

			$searches = new searches($this->getDb());
			$this->set('popular', $searches->select('*', 'ORDER BY count DESC LIMIT 0, 10'));
		}

	}

?>
