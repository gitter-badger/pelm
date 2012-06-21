import sbt._
import Keys._


object General {
  val settings = Defaults.defaultSettings ++ Seq (
    name := "PELM",
    version := "1.0.0",
    scalaVersion := "2.9.2"
  )


  lazy val fullPelmSettings =    General.settings 

}

object PelmBuild extends Build {
  lazy val main = Project (
    "PELM",
    file("."),
    settings = General.fullPelmSettings 
  )
}



