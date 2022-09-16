const rootRoute = "/";
const authentifications = "/authentications";
const authentifcationsName = "Authentifications";
const inscription = "/signup";
const inscriptionName = "S'inscrire";
const cours = "/course";
const coursName = "Cours";
const home = "/home";
const homeName = "Home";
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
];
