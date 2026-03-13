<?php
class userObj {
    private $username;
    private $password;
    private $nome;
    private $cognome;
    private $indirizzo;
    private $citta;
    private $cap;
    private $email;
    private $telefono;
    private $attivo;
    private $idProfilo;
    private $db;

    public function __construct($db, $username, $password = null, $nome = null, $cognome = null,
                                $indirizzo = null, $citta = null, $cap = null,
                                $email = null, $telefono = null, $attivo = null,
                                $idProfilo = null) {
        $this->db            = $db;
        $this->username      = $username;
        $this->password      = $password ? password_hash($password, PASSWORD_DEFAULT) : null;
        $this->nome          = $nome;
        $this->cognome       = $cognome;
        $this->indirizzo     = $indirizzo;
        $this->citta         = $citta;
        $this->cap           = $cap;
        $this->email         = $email;
        $this->telefono      = $telefono;
        $this->attivo        = $attivo;
        $this->idProfilo     = $idProfilo;
    }

    public function get($property) {
        if (property_exists($this, $property) && $property !== 'db') {
            return $this->$property;
        }
        return null;
    }

    public function set($property, $value) {
        if (property_exists($this, $property) && $property !== 'db' && $property !== 'username') {
            if ($property === 'password') {
                $value = password_hash($value, PASSWORD_DEFAULT);
            }

            $this->$property = $value;

            $sql = "UPDATE utenti SET $property = :value WHERE username = :username";
            $stmt = $this->db->prepare($sql);
            return $stmt->execute([
                ':value'    => $value,
                ':username' => $this->username
            ]);
        }
        return false;
    }

    public function setDataLogout($dataLogout, $value, $idSessione) {
        $this->$dataLogout = $value;

        $sql = "UPDATE sessioni SET dataLogout = :value WHERE idSessione = :id_s";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([
            ':value' => $value,
            ':id_s'  => $idSessione
        ]);
    }

    public function create() {
        $sql = "INSERT INTO utenti 
                    (username, password, nome, cognome, indirizzo, citta, cap, email, telefono, attivo, idProfilo) 
                VALUES 
                    (:username, :password, :nome, :cognome, :indirizzo, :citta, :cap, :email, :telefono, :attivo, :idProfilo)";

        $stmt = $this->db->prepare($sql);
        return $stmt->execute([
            ':username'  => $this->username,
            ':password'  => $this->password,
            ':nome'      => $this->nome,
            ':cognome'   => $this->cognome,
            ':indirizzo' => $this->indirizzo,
            ':citta'     => $this->citta,
            ':cap'       => $this->cap,
            ':email'     => $this->email,
            ':telefono'  => $this->telefono,
            ':attivo'    => $this->attivo,
            ':idProfilo' => $this->idProfilo
        ]);
    }

    public function createDataLogin($value, $idSessione, $idUtente) {
        $sql = "INSERT INTO sessioni (idSessione, idUtente, dataLogin) VALUES (:id_s, :id_u, :dataLogin)";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([
            ':id_s'      => $idSessione,
            ':id_u'      => $idUtente,
            ':dataLogin' => $value
        ]);
    }

    public function readAll() {
        $sql  = "SELECT username, nome, cognome, indirizzo, citta, cap, email, telefono, attivo FROM utenti";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function findByUsername() {
        $sql = "SELECT id, username, password, nome, cognome, indirizzo, citta, cap, email, telefono, attivo, idProfilo
                FROM utenti
                WHERE username = :username";

        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':username', $this->username);
        $stmt->execute();

        return $stmt->fetch();
    }

    public function readAccess() {
        $sql = "SELECT username, dataLogin, dataLogout 
                FROM sessioni s
                JOIN utenti u ON u.id = s.idUtente";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function update($usernameOriginale) {
        $sql = "UPDATE utenti SET
                    nome      = :nome,
                    cognome   = :cognome,
                    indirizzo = :indirizzo,
                    citta     = :citta,
                    cap       = :cap,
                    email     = :email,
                    telefono  = :telefono,
                    attivo    = :attivo
                WHERE username = :username";

        $stmt = $this->db->prepare($sql);
        return $stmt->execute([
            ':nome'      => $this->nome,
            ':cognome'   => $this->cognome,
            ':indirizzo' => $this->indirizzo,
            ':citta'     => $this->citta,
            ':cap'       => $this->cap,
            ':email'     => $this->email,
            ':telefono'  => $this->telefono,
            ':attivo'    => $this->attivo,
            ':username'  => $usernameOriginale
        ]);
    }

    public function delete() {
        $sql  = "DELETE FROM utenti WHERE username = :username";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([':username' => $this->username]);
    }

    public function print() {
        echo "<b>Username: </b>"  . $this->username  . "<br>";
        echo "<b>Nome: </b>"      . $this->nome      . "<br>";
        echo "<b>Cognome: </b>"   . $this->cognome   . "<br>";
        echo "<b>Indirizzo: </b>" . $this->indirizzo . "<br>";
        echo "<b>Città: </b>"     . $this->citta     . "<br>";
        echo "<b>CAP: </b>"       . $this->cap       . "<br>";
        echo "<b>Email: </b>"     . $this->email     . "<br>";
        echo "<b>Telefono: </b>"  . $this->telefono  . "<br>";
        echo "<b>Attivo: </b>"    . $this->attivo    . "<br>";
        echo "<b>Ruolo: </b>"     . $this->idProfilo . "<br>";
    }
}
?>