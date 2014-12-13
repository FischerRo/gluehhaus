<?php
    error_reporting(E_ALL);

        /*** begin output buffering ***/
        // ob_start();

        /*** include the header file ***/
        include 'includes/header.php';

        /*** check the form has been posted ***/
         if(isset(
                $_POST['wein_id'],
                $_POST['zutat_id'],
                $_POST['basispreis']
                )
            )
         {
            /*** if we are here, include the db connection ***/
            include 'includes/conn.php';

            /*** test for db connection ***/
            if($db)
            {
                /*** excape the string ***/
                $gluehwein_name = mysql_real_escape_string($_POST['name']);
                $wein = $_POST['wein_id'];
                $zutat = $_POST['zutat_id'];
                $preis = $_POST['basispreis'];

                /*** the sql query ***/
                $sql = "INSERT INTO Gluehwein (Wein_Id, Zutat_Id, Name, Basispreis) 
                            VALUES ($wein, $zutat, '$gluehwein_name', $preis)";


                /*** run the query ***/
                if(mysql_query($sql))
                {

                    echo '<p>Gl&uuml;hwein '.$gluehwein_name.' erfunden </p>';
                    echo '<a href="gluehweinerls.php">Zur&uuml;ck</a>';
                }
                else
                {
                    echo 'Oops, da ist was schief gelaufen.<br/>';
                    echo mysql_errno($link).': '.mysql_error($link).'<br/>';

                }
            }
            else
            {
                echo 'Unable to reach db';
            }
        }
        else
        {
            echo 'Invalid Submission';
        }

        /*** include the footer file ***/
        include 'includes/footer.php';

    /*** flush the buffer ***/
    // ob_end_flush();
?>