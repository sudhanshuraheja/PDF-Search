<?php

  class files extends Model {
    public function __construct($database) {
      $this->construct($database, "files", array(
				"id" => "int",
				"name" => "varchar_1024",
				"link" => "varchar_1024",
				"approved" => "int",
				"downloaded" => "int",
				"created" => "int"
      ));
    }
  }

  class gtx_users extends Model {
    public function __construct($database) {
      $this->construct($database, "gtx_users", array(
				"id" => "int",
				"username" => "varchar_64",
				"password" => "varchar_64",
				"email" => "varchar_64",
				"lastlogin" => "varchar_32",
				"ip" => "varchar_32",
				"name" => "varchar_64",
				"hash" => "varchar_64"
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