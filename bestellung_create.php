<?php
    error_reporting(E_ALL);

        /*** include the header file ***/
        include 'includes/header.php';

        // print_r($_POST);

		/*** check the form has been posted ***/
		if(isset(
				$_POST['bp'],
				$_POST['kassierer']
				)
			)
		{
            /*** if we are here, include the db connection ***/
            include 'includes/conn.php';

            /*** test for db connection ***/
            if($db)
            {

		        $bps = $_POST['bp'];
		        $kassierer_id = $_POST['kassierer'];
		        $bestellzeit = date("Y-m-d H:i:s");


		        /*** Create Bestellung ***/
		        $sql = "INSERT INTO Bestellung (Bestellzeit, Kassierer_Id)
		        			VALUES ('$bestellzeit', $kassierer_id)";

               	/*** run the query ***/
                if(mysql_query($sql))
                {
					//Id der gerade erstellten Bestellung
					$bestellung = mysql_insert_id();
			        foreach ($bps as $position) {

			        	// echo $position['menge'].', '.$position['gluehwein'].'<br/>';
			        	//Get IDs für Wein und Zutat (see option value)
			        	$ids = explode("_", $position['gluehwein']);
			        	$wein_id = $ids[0];
			        	$zutat_id = $ids[1];
			        	$menge = $position['menge'];

			        	$sql_bp = "($bestellung, $wein_id, $zutat_id, $menge)";

					   	/*** run the query ***/
		                if(mysql_query($sql_bp))
		                {
							echo '<p>Bestellposition '.$wein_id.','.$zutat_id.' ['.$menge.' Mal]'.' f&uuml;r Bestellung '.$bestellung.' angelegt.</p>';
		                	
		                }			        
                        else
		                {
		                    echo 'Oops, da ist was schief gelaufen.<br/>';
		                    echo mysql_errno($link).': '.mysql_error($link).'<br/>';

		                }

			        }
                  
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

        echo '<p><a href="index.php">Zur&uuml;ck</a></p>';

        /*** include the footer file ***/
        include 'includes/footer.php';

    /*** flush the buffer ***/
    // ob_end_flush();
?>