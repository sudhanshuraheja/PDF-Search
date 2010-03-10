<div class='container'>

<?php $search = $this->get('search'); ?>

	<br /><br />&nbsp;
	<div class='span-24'>
		<div class='span-16'>Type in your search query below</div>
		<div class='span-8 last right'><a href='<?php echo href('/add') ?>'>Click here to add a PDF</a></div>
	</div>

	<div class='span-24'>
		<form method='get' action=''>
			<input type='text' name='q' value='<?php echo $search; ?>' class='searchInput' />
		</form>
		<br />&nbsp;
	</div>

<?php
	$count = 0;
	$results = $this->get('results');
	$max_score = 0;
	foreach($results as $result) {
		$count++;
		$class = ( ($count % 2) == 0 ) ? '' : 'odd';
		$max_score = ($result['score'] > $max_score) ? $result['score'] : $max_score;
		$link = ( isset($result['link']) && ($result['link'] != '')) ? $result['link'] : 'http://www.google.com/search?q=' . urlencode($result['name'] . ' filetype:pdf');
?>

	<div class='span-24 slot <?php echo $class; ?>'>
		<div class='span-2 number'><?php echo $count; ?>.</div>
		<div class='span-18'>
			<div class='span-18 last title'><?php echo str_replace('-', ' ', $result['name']); ?></div>
			<div class='span-18 last'>
				<div class='span-3 download'><a target='_blank' href='<?php echo href('/public/books/' . $result['name'] . '.txt') ?>'>Download Text</a></div>
				<div class='span-3 download'><a target='_blank' href='<?php echo $link; ?>'>Download PDF</a></div>
				<div class='span-12 last'>&nbsp;</div>
			</div>
		</div>
		<div class='span-4 last accuracy'><?php echo round(( ($result['score'] / $max_score) * 100), 0) ?></div>
	</div>

<?php
	}

	if( (strlen($search) > 0) && (count($results) == 0) ) {
?>
	<div class='span-24 nofound'>
		Couldn't find anything!
	</div>
<?php
	}
?>

</div>
