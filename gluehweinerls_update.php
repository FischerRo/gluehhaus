<?php
    error_reporting(E_ALL);

        /*** begin output buffering ***/
        // ob_start();

        /*** include the header file ***/
        include 'includes/header.php';

        /*** check the form has been posted and the session variable is set ***/
         if(isset(
                $_POST['wein_alt'], 
                $_POST['zutat_alt'], 
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
                $wein_alt = $_POST['wein_alt'];
                $zutat_alt = $_POST['zutat_alt'];
                $wein = $_POST['wein_id'];
                $zutat = $_POST['zutat_id'];
                $preis = $_POST['basispreis'];

                /*** the sql query ***/
                $sql = "UPDATE Gluehwein 
                        SET 
                            Wein_Id = $wein, 
                            Zutat_Id = $zutat, 
                            Name = '$gluehwein_name',
                            Basispreis = $preis
                        WHERE 
                            Wein_Id = $wein_alt
                            AND
                            Zutat_Id = $zutat_alt
                        ";


                /*** run the query ***/
                if(mysql_query($sql))
                {

                    echo '<p>Gl&uuml;hwein '.$gluehwein_name.' aktualisiert </p>';
                    echo '<a href="gluehweinerls.php">Zur&uuml;ck</a>';
                }
                else
                {
                    echo 'Oops, da ist was schief gelaufen.<br/>';
                    echo mysql_errno($link).': '.mysql_error($link).'<br/>';
                    echo 'Abfrage war: '.$sql;

                }
            }
            else
            {
                echo 'Unable to process form';
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