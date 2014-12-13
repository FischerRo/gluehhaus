<?php
    error_reporting(E_ALL);

        /*** begin output buffering ***/
        // ob_start();

        /*** include the header file ***/
        include 'includes/header.php';

        /*** check the form has been posted***/
         if(isset(
                $_GET['wein_id'], 
                $_GET['zutat_id']
                )
            )
         {
            /*** if we are here, include the db connection ***/
            include 'includes/conn.php';

            /*** test for db connection ***/
            if($db)
            {
                /*** excape the string ***/
                $wein = $_GET['wein_id'];
                $zutat = $_GET['zutat_id'];

                /*** the sql query ***/
                $sql = "DELETE FROM gluehwein 
                        WHERE 
                            Wein_Id = $wein
                            AND
                            Zutat_Id = $zutat
                        ";


                /*** run the query ***/
                if(mysql_query($sql))
                {

                    echo '<p>Gl&uuml;hwein '.$gluehwein_name.' gelöscht </p>';
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