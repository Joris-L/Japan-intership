<?php
// Intern object
class Intern{

    // database connection and table name
    private $conn;
    private $table_name = "interns";

    // Intern properties
    public $user_id;
    public $fullname;
    public $email;
    public $description;
    public $profile_picture;
    public $video_link;
    public $tags;
    public $nationality;
    public $living_country;
    public $graduated;
    public $student;
    public $native_lang;
    public $fluent_lang;

    // constructor
    public function __construct($db){
        $this->conn = $db;
    }

    // create new Intern record   
    function create(){

        // query to insert a new intern in to the database with given user input
        $query = "INSERT INTO " . $this->table_name . "
            SET
                user_id = :user_id,
                fullname = :fullname,
                email = :email,
                description = :description,
                profile_picture = :profile_picture,
                video_link = :video_link,
                tags = :tags,
                nationality = :nationality,
                living_country = :living_country,
                graduated = :graduated,
                student = :student,
                native_lang = :native_lang,
                fluent_lang = :fluent_lang
                ";

        // prepare the query
        $stmt = $this->conn->prepare($query);

        // sanitize
        $this->fullname=htmlspecialchars(strip_tags($this->fullname));
        $this->email=htmlspecialchars(strip_tags($this->email));
        $this->description=htmlspecialchars(strip_tags($this->description));
        $this->profile_picture=htmlspecialchars(strip_tags($this->profile_picture));
        $this->video_link=htmlspecialchars(strip_tags($this->video_link));
        $this->tags=htmlspecialchars(strip_tags($this->tags));
        $this->nationality=htmlspecialchars(strip_tags($this->nationality));
        $this->living_country=htmlspecialchars(strip_tags($this->living_country));
        $this->graduated=htmlspecialchars(strip_tags($this->graduated));
        $this->student=htmlspecialchars(strip_tags($this->student));
        $this->native_lang=htmlspecialchars(strip_tags($this->native_lang));
        $this->fluent_lang=htmlspecialchars(strip_tags($this->fluent_lang));


        // bind the values
        $stmt->bindParam(':user_id', $this->user_id);
        $stmt->bindParam(':fullname', $this->fullname);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':profile_picture', $this->profile_picture);
        $stmt->bindParam(':video_link', $this->video_link);
        $stmt->bindParam(':tags', $this->tags);
        $stmt->bindParam(':nationality', $this->nationality);
        $stmt->bindParam(':living_country', $this->living_country);
        $stmt->bindParam(':graduated', $this->graduated);
        $stmt->bindParam(':student', $this->student);
        $stmt->bindParam(':native_lang', $this->native_lang);
        $stmt->bindParam(':fluent_lang', $this->fluent_lang);

        // execute the query, also check if query was successful
        if($stmt->execute()){
            return true;
        }

        return false;
    }

    function getProfile(){

        // query to get profile with the userid that was send
        $query = "SELECT * FROM ".$this->table_name." WHERE user_id = :id LIMIT 1";

        // prepare the query
        $stmt = $this->conn->prepare($query);

        // bind the value
        $stmt->bindParam(':id', $this->id);

        // execute the query
        $stmt->execute();

        // get number of rows
        $num = $stmt->rowCount();

        // if a profile exists with that userid
        if($num>0){

            // get results
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $rows;
        }

        // return false if no profile with the userid exists
        return false;
    }

    function update(){

        // query to update the profile with given user_id
        $query = "UPDATE " . $this->table_name . "
            SET
            fullname = :fullname,
            email = :email,
            description = :description,
            profile_picture = :profile_picture,
            video_link = :video_link,
            tags = :tags,
            nationality = :nationality,
            living_country = :living_country,
            graduated = :graduated,
            student = :student,
            native_lang = :native_lang,
            fluent_lang = :fluent_lang
            WHERE user_id = :user_id";

        // prepare the query
        $stmt = $this->conn->prepare($query);

        //sanitize
        $this->fullname=htmlspecialchars(strip_tags($this->fullname));
        $this->email=htmlspecialchars(strip_tags($this->email));
        $this->description=htmlspecialchars(strip_tags($this->description));
        $this->profile_picture=htmlspecialchars(strip_tags($this->profile_picture));
        $this->video_link=htmlspecialchars(strip_tags($this->video_link));
        $this->tags=htmlspecialchars(strip_tags($this->tags));
        $this->nationality=htmlspecialchars(strip_tags($this->nationality));
        $this->living_country=htmlspecialchars(strip_tags($this->living_country));
        $this->graduated=htmlspecialchars(strip_tags($this->graduated));
        $this->student=htmlspecialchars(strip_tags($this->student));
        $this->native_lang=htmlspecialchars(strip_tags($this->native_lang));
        $this->fluent_lang=htmlspecialchars(strip_tags($this->fluent_lang));

        // bind the values
        $stmt->bindParam(':user_id', $this->user_id);
        $stmt->bindParam(':fullname', $this->fullname);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':profile_picture', $this->profile_picture);
        $stmt->bindParam(':video_link', $this->video_link);
        $stmt->bindParam(':tags', $this->tags);
        $stmt->bindParam(':nationality', $this->nationality);
        $stmt->bindParam(':living_country', $this->living_country);
        $stmt->bindParam(':graduated', $this->graduated);
        $stmt->bindParam(':student', $this->student);
        $stmt->bindParam(':native_lang', $this->native_lang);
        $stmt->bindParam(':fluent_lang', $this->fluent_lang);

        // execute the query
        if($stmt->execute()){
            return true;
        }

        return false;
    }
}