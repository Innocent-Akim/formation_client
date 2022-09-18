import 'package:formation_client/learning/loarning.dart';

const rootRoute = "/";
const authentifications = "/authentications";
const authentifcationsName = "Authentifications";
const inscription = "/signup";
const inscriptionName = "S'inscrire";
const cours = "/course";
const coursName = "Cours";
const home = "/home";
const homeName = "Home";
const learnig = "/loarning";
const learnigName = "Learnig";

class MenuItem {
  final String name;
  final String route;
  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(authentifcationsName, authentifications),
  MenuItem(inscriptionName, inscription),
  MenuItem(coursName, cours),
  MenuItem(homeName, home),
    MenuItem(learnigName, learnig),
];
