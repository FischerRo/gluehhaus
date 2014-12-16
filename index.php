<?php

    /*** include the header ***/
    include 'includes/header.php';

    /*** include the database connection ***/
    include 'includes/conn.php';

    /*** check for valid database connection ***/
    if($db)
    {
        /*** the SQL query to select last 10 Bestellpositionen ***/
        $sql = "SELECT
                    Bestellung_Id,
                    Wein_Id as Wein,
                    Zutat_Id as Zutat, 
                    Anzahl
                FROM Bestellposition
                ORDER BY Bestellung_Id DESC";


        if(isset($_GET['filter'])){
            //TODO: USE FILTER IN SQL STATEMENT
            echo '<p>FILTER NOT IMPLEMENTED!</p>';
        }



        /*** run the query ***/
        $result = mysql_query($sql) or die(mysql_error());

        /*** create the blog array ***/
        $orderposition_array = array();

        /*** check for a valid resource ***/
        if(is_resource($result))
        {
            /*** check there are results ***/
            if(mysql_num_rows($result) != 0)
            {
                /*** stuff the blog entries into the blog array ***/
                while($row = mysql_fetch_array($result, MYSQL_ASSOC))
                {
                    $orderposition_array[] = $row;
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
        echo 'Bisher noch kein Gluehwein verkauft';
    }
?>

<div class="section">
    <p>
    &Uuml;bersicht der letzten 10 Bestellungen <br/> 
    <form action="index.php">
         <table width="60%" style="padding:1px 50px 0px 40px;">
            <tr>
               <td>
                    <input type="submit" value="Filter"/>
                </td>
                <td>
                    <input name="filter" type="text" value="<?php echo $filter?>"/>
                </td>

            </tr>
        </table>
    </form>
    </p>



    <?php

        if(sizeof($orderposition_array) > 0)
        {

            echo '<table width="100%">';
            echo '<tr>';
                echo '<th>Bestellung</th>';
                echo '<th>Bestellzeit</th>';
                echo '<th>Anzahl</th>';
                echo '<th>Gl&uuml;hweinerl</th>';
                echo '<th>Wein</th>';
                echo '<th>Zutat</th>';
                echo '<th>Kassierer</th>';
            echo '</tr>';
            
            /*** loop over the orderposition array and display orderpositions ***/
            foreach($orderposition_array as $orderposition)
            {

                echo '<tr>';
                echo '<td align="center">'.$orderposition['Bestellung_Id'].'</td>';
                echo '<td>'.$orderposition['Bestellzeit'].'</td>';
                echo '<td align="center">'.$orderposition['Anzahl'].'</td>';
                echo '<td>'.$orderposition['Gluehwein'].'</td>';
                echo '<td>'.$orderposition['Wein'].'</td>';
                echo '<td>'.$orderposition['Zutat'].'</td>';
                echo '<td>'.$orderposition['Nachname'].", ".$orderposition['Vorname'].'</td>';
                echo '</tr>';
            }
            echo '</table>';    
        }
        else
        {
            echo 'Nix verkauft! - trinkt denn niemand mehr Gl&uuml;hwein?';
        } 
    ?>
</div> 

<?php
        /*** include the footer file ***/
        include 'includes/footer.php';
?>