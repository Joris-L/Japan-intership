<?php
// InternSearch object
class InternSearch{

    // database connection and table name
    private $conn;
    private $table_name = "interns";

    // InternSearch properties
    public $search;

    // constructor
    public function __construct($db){
        $this->conn = $db;
    }

    //search the intern table
    function search(){

        // query to search tags column in table interns for rows that contain the text input from the user.
        $query = "SELECT * FROM " . $this->table_name . "
        WHERE tags LIKE :search LIMIT 0, 50";

        // prepare the query
        $stmt = $this->conn->prepare( $query );

        // sanitize
        $this->search=htmlspecialchars(strip_tags($this->search));
        $s = "%".$this->search."%";

        // bind given search value
        $stmt->bindParam(':search', $s);

        // execute the query
        $stmt->execute();

        // get number of rows
        $num = $stmt->rowCount();

        // if there are search results then fetch it al and return it
        if($num>0){

            // get record details / values
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $rows;
        }

        // return false if there are no search results
        return false;
    }
}