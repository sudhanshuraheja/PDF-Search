<?php

  class files extends Model {
    public function __construct($database) {
      $this->construct($database, "files", array(
				"id" => "int",
				"name" => "varchar_1024",
				"link" => "varchar_1024",
				"approved" => "int",
				"created" => "int"
      ));
    }
  }

  class indexes extends Model {
    public function __construct($database) {
      $this->construct($database, "indexes", array(
				"id" => "int",
				"file" => "int",
				"stem" => "varchar_256",
				"count" => "int",
				"wpm" => "int"
      ));
    }
  }

  class searches extends Model {
    public function __construct($database) {
      $this->construct($database, "searches", array(
				"id" => "int",
				"term" => "varchar_256",
				"date" => "int"
      ));
    }
  }

?>