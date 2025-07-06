import 'package:space_app/Core/utils/appimages.dart';

class Planet {
  final String name;
  final String subtitle;
  final String imageWithMoon;
  final String imageWithoutMoon;
  final String about;

  Planet( {
   required this.imageWithoutMoon,
    required this.name,
    required this.subtitle,
    required this.imageWithMoon,
    required this.about,
  });

  static List<Planet> planets = [
    Planet(
      name: "MERCURY",
      subtitle: "The Swift Planet",
      imageWithMoon: AppImages.assetsImagesMercuryWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesMercuryPng,
      about: "Mercury is the first planet from the Sun and the smallest in the Solar System. It is a terrestrial planet with a heavily cratered surface due to overlapping impact events. These features are well preserved since the planet has no geological activity and an extremely tenuous atmosphere called an exosphere."
    ),
    Planet(
      name: "VENUS",
      subtitle: "The Morning Star",
      imageWithMoon: AppImages.assetsImagesVenusWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesVenusPng,
      about: "Venus is the second planet from the Sun. It is a rocky planet with the densest atmosphere of all the rocky bodies in the Solar System, and the only one with a mass and size that is close to that of its orbital neighbour Earth."
    ),
    Planet(
      name: "EARTH",
      subtitle: "The Living Planet",
      imageWithMoon: AppImages.assetsImagesEarthWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesEarthPng,
      about: "While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water  \"on the surface\".  Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal."
    ),
    Planet(
      name: "MARS",
      subtitle: "The Red Planet",
      imageWithMoon: AppImages.assetsImagesMarsWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesMarsPng,
      about: "Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname \"the Red Planet\". Mars's radius is second smallest among the planets in the Solar System at 3,389.5 km."
    ),
    Planet(
      name: "JUPITER",
      subtitle: "The Giant Planet",
      imageWithMoon: AppImages.assetsImagesJupiterWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesJupiterPng,
      about: "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun."
    ),
    Planet(
      name: "SATURN",
      subtitle: "The Ringed Planet",
      imageWithMoon: AppImages.assetsImagesSaturnWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesSaturnPng,
      about: "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive."
    ),
    Planet(
      name: "NEPTUNE",
      subtitle: "The Windy Planet",
      imageWithMoon: AppImages.assetsImagesNeptuneWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesNeptunePng,
      about: "Neptune is the eighth and farthest planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus."
    ),
    Planet(
      name: "URANUS",
      subtitle: "The Ice Giant",
      imageWithMoon: AppImages.assetsImagesUranusWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesUranusPng,
      about: "Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called 'ice' or volatiles."
    ),
    Planet(
      name: "PLUTO",
      subtitle: "The Dwarf Planet",
      imageWithMoon: AppImages.assetsImagesPlutoWithMoonPng,
      imageWithoutMoon: AppImages.assetsImagesPlutoPng,
      about: "Pluto has a moderately eccentric and inclined orbit, ranging from 30 to 49 astronomical units (4.5 to 7.3 billion kilometers; 2.8 to 4.6 billion miles) from the Sun. Light from the Sun takes 5.5 hours to reach Pluto at its orbital distance of 39.5 AU (5.91 billion km; 3.67 billion mi)."
    ),
  ];
}