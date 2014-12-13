<?php

    /*** include the header ***/
    include 'includes/header.php';

    /*** include the database connection ***/
    include 'includes/conn.php';

    /*** check for valid database connection ***/
    if($db)
    {
        /*** the SQL query to select last 5 Bestellpositionen ***/
        $sql = "SELECT
                    Wein_Id,
                    Zutat_Id,
                    Name, 
                    Basispreis
                FROM Gluehwein";

        $sql_kassierer = "SELECT
				            Kassierer_Id,
				            Nachname,
				            Vorname 
				        FROM Kassierer";

        /*** run the query ***/
        $result = mysql_query($sql) or die(mysql_error());
        $result_kassierer = mysql_query($sql_kassierer) or die(mysql_error());

        /*** create the arrays ***/
        $gluehwein_array = array();
        $kassierer_array = array();

        /*** check for a valid resource ***/
        if(is_resource($result) & is_resource($result_kassierer))
        {
            /*** check there are results ***/
            if(mysql_num_rows($result) != 0)
            {
                /*** stuff the blog entries into the blog array ***/
                while($row = mysql_fetch_array($result, MYSQL_ASSOC))
                {
                    $gluehwein_array[] = $row;
                    /** Uncomment these lines to print raw sql results **/ 
                    // print_r($row);
                    // echo '<br/>';
                }
            }

            /*** check there are results ***/
            if(mysql_num_rows($result_kassierer) != 0)
            {
                /*** stuff the blog entries into the blog array ***/
                while($row = mysql_fetch_array($result_kassierer, MYSQL_ASSOC))
                {
                    $kassierer_array[] = $row;
                    /** Uncomment these lines to print raw sql results **/ 
                    // print_r($row);
                    // echo '<br/>';
                }
            }

        }
        else
        {
            echo 'Database Unavailable';
        }
    }
    else
    {
        echo 'Bisher noch kein Gluehwein angelegt';
    }
?>

<div class="section">
<!-- 	<p>
	Neue Bestellung <br/> 
	</p> -->
    <form action="bestellung_create.php" method="post" onSubmit="enumerate()">
        <table id="bestellpositionen" width="60%" style="padding:1px 50px 0px 40px;">
            <tr>
                <th colspan="2">
                    <label>Bestell&uuml;bersicht</label>
                </th>
            </tr>
            <tr>
                <th>
                    <label>Menge</label>
                </th>
                <th>
                    <label>Gl&uuml;hwein</label>
                </th>
            </tr>
            <tr id="bp_last">
                <td>
                    <input name="bp[x][menge]" type="number" value="1" step="1" min="0" max="10"/>
                </td>
                 <td>
                    <select name="bp[x][gluehwein]">
                        <?php

                            if(sizeof($gluehwein_array) > 0)
                            {
                            foreach($gluehwein_array as $gluehwein)
                                {
                                    echo '<option value="'.$gluehwein['Wein_Id'].'_'.$gluehwein['Zutat_Id'].'">';
                                    echo $gluehwein['Name'];
                                    echo '</option>';
                                }
                            }
                            else
                            {
                                echo 'Erst Wein anlegen';
                            } 

                        ?>
                    </select>
                </td>
            </tr>
            <tr>
              	<td>
                    <label>Kassierer: </label>
                </td>
                 <td>
                    <select name="kassierer">
                        <?php

                            if(sizeof($kassierer_array) > 0)
                            {
                            foreach($kassierer_array as $kassierer)
                                {
                                    echo '<option value="'.$kassierer['Kassierer_Id'].'">';
                                    echo $kassierer['Vorname'].' '.$kassierer['Nachname'];
                                    echo '</option>';
                                }
                            }
                            else
                            {
                                echo 'Erst Kassierer anlegen';
                            } 

                        ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Bestellen" width="30%"/>
                </td>
            </tr>
        </table>
    </form>
    <p>
	    <br/>
		<button type="button" id="add_bp">Position hinzufügen</button>        
    </p>
</div> 

<script type="text/javascript"> 

	function enumerate() {

		var inputs = $('#bestellpositionen').find("input").not(':input[type=button], :input[type=submit]');
		for (var i = 0; i < inputs.length; ++i) {
	  		$(inputs[i]).attr("name", "bp[" + i + "][menge]");
		}

		var inputs = $('#bestellpositionen').find("select");
		console.log(inputs.length);
		for (var i = 0; i < inputs.length; ++i) {
			if($(inputs[i]).attr("name").substring(0,2) == 'bp'){
		  		$(inputs[i]).attr("name", "bp[" + i + "][gluehwein]");
			}

		}
		//Submit form?
    	return true;
	}

	$( '#add_bp' ).click(function() {
		var bp_row = $('#bp_last').clone();
		$('#bp_last').after(bp_row);
		$('#bp_last').attr("id","");
		enumerate();
	});




</script>


<?php
        /*** include the footer file ***/
        include 'includes/footer.php';
?>