import 'package:b2/b2_1.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: b2_1(),
  ));
}

// get method
//   insert

// <?php
//
// $db=mysqli_connect("localhost","id19546635_deep","Flutter@1234","id19546635_deepjasani");
//
// $temp=array();
// $q="select * from b2_1";
// $res=mysqli_query($db,$q);
// while($arr=mysqli_fetch_assoc($res))
// {
// $temp[]=$arr;
// }
// echo json_encode($temp);
//
// ?>


//get data
// <?php
// //host,user,password,db
// $db=mysqli_connect("localhost","id19546635_deep","Flutter@1234","id19546635_deepjasani");
//
// $type=$_GET['cat_type'];
// $name=$_GET['prod_name'];
// $desc=$_GET['cat_description'];
// $qty=$_GET['cat_mrp'];
//
// $q="insert into b2_1 values(null,'$type','$name','$desc','$qty')";
// if(mysqli_query($db,$q))
// {
// echo "Data is inserted";
// }
// else
// {
// echo "Data is not inserted";
// }
// ?>