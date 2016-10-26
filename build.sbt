
//import com.typesafe.sbt.packager.docker.Cmd

name := "scala-sbt-sample"

version := "1.0"

scalaVersion := "2.11.8"

libraryDependencies ++= Seq("com.amazonaws" %   "aws-java-sdk"      %   "1.3.11")


//enablePlugins(JavaAppPackaging)
//
//enablePlugins(DockerPlugin)
//
//enablePlugins(DockerSpotifyClientPlugin)
//
//dockerBaseImage := "ankitkariryaa/sbt-javac"
