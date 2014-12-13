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
                    Wein_Id as Wein,
                    Zutat_Id as Zutat, 
                    Name, 
                    Basispreis as Preis
                FROM Gluehwein";


        /*** run the query ***/
        $result = mysql_query($sql) or die(mysql_error());

        /*** create the blog array ***/
        $gluehwein_array = array();

        /*** check for a valid resource ***/
        if(is_resource($result))
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
    <p>
    Die Gl&uuml;hweinerls ham m'r <br/> 
    </p>

    <?php

        if(sizeof($gluehwein_array) > 0)
        {

            echo '<table width="100%">';
            echo '<tr>';
                echo '<th>Gl&uuml;hweinerl</th>';
                echo '<th>Wein</th>';
                echo '<th>Zutat</th>';
                echo '<th>Preis</th>';
            echo '</tr>';
            
            /*** loop over the orderposition array and display orderpositions ***/
            foreach($gluehwein_array as $gluehwein)
            {

                echo '<tr>';
                echo '<td>'.$gluehwein['Name']
                        .' (<a href="gluehweinerls_edit.php?wein_id='.$gluehwein['Wein'].'&zutat_id='.$gluehwein['Zutat'].'">edit</a>'
                        .' | <a href="gluehweinerls_delete.php?wein_id='.$gluehwein['Wein'].'&zutat_id='.$gluehwein['Zutat'].'">delete)</a>'
                    .'</td>';
                echo '<td>'.$gluehwein['Wein'].'</td>';
                echo '<td>'.$gluehwein['Zutat'].'</td>';
                echo '<td>'.$gluehwein['Preis'].'</td>';
                echo '</tr>';
            }
            echo '</table>';    
        }
        else
        {
            echo 'Nix verkauft! - trinkt denn niemand mehr Gl&uuml;hwein?';
        } 
    ?>
    <br/>
    <a href="gluehweinerls_add.php">Mehr Gl&uuml;hweinerls erfinden...</a>
</div> 

<?php
        /*** include the footer file ***/
        include 'includes/footer.php';
?>