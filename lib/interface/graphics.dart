import 'package:cotwcastmate/generated/assets.gen.dart';
import 'package:cotwcastmate/miscellaneous/enums.dart';

class Graphics {
  static final Map<String, String> _reserve = {
    "RESERVE:GOLDEN_RIDGE_RESERVE": Assets.graphics.reserves.goldenRidgeReserve.path,
    "RESERVE:TROLLSPORET_NATURE_RESERVE": Assets.graphics.reserves.trollsporetNatureReserve.path,
    "RESERVE:AGUAS_CLARAS_MUNICIPIO": Assets.graphics.reserves.aguasClarasMunicipio.path,
    "RESERVE:IZILO_ZASENDULO": Assets.graphics.reserves.iziloZasendulo.path
  };

  static final Map<String, String> _fish = {
    "FISH:LEPOMIS_GIBBOSUS": Assets.graphics.fish.pumpkinseed.path,
    "FISH:LEPOMIS_MACROCHIRUS": Assets.graphics.fish.bluegill.path,
    "FISH:ONCORHYNCHUS_NERKA": Assets.graphics.fish.kokaneeSalmon.path,
    "FISH:AMEIURUS_NEBULOSUS": Assets.graphics.fish.bullheadCatfish.path,
    "FISH:CTENOPHARYNGODON_IDELLA": Assets.graphics.fish.grassCarp.path,
    "FISH:GOLDSTEIN": Assets.graphics.fish.goldstein.path,
    "FISH:ICTALURUS_PUNCTATUS": Assets.graphics.fish.channelCatfish.path,
    "FISH:SALVELINUS_ALPINUS": Assets.graphics.fish.arcticChar.path,
    "FISH:ANGUILLA_BENGALENSIS": Assets.graphics.fish.africanMottledEel.path,
    "FISH:PERCA_FLAVESCENS": Assets.graphics.fish.yellowPerch.path,
    "FISH:SALMO_SALAR": Assets.graphics.fish.atlanticSalmon.path,
    "FISH:THYMALLUS_THYMALLUS": Assets.graphics.fish.grayling.path,
    "FISH:SALVELINUS_NAMAYCUSH": Assets.graphics.fish.lakeTrout.path,
    "FISH:LOTA_LOTA": Assets.graphics.fish.burbot.path,
    "FISH:MICROPTERUS_DOLOMIEU": Assets.graphics.fish.smallmouthBass.path,
    "FISH:LEUCISCUS_IDUS": Assets.graphics.fish.ide.path,
    "FISH:HYDROCYNUS_VITTATUS": Assets.graphics.fish.africanTigerfish.path,
    "FISH:SANDER_CANADENSIS": Assets.graphics.fish.sauger.path,
    "FISH:ANGUILLA_ANGUILLA": Assets.graphics.fish.europeanEel.path,
    "FISH:COTTUS_GOBIO": Assets.graphics.fish.europeanBullhead.path,
    "FISH:MICROPTERUS_SALMOIDES": Assets.graphics.fish.largemouthBass.path,
    "FISH:PROSOPIUM_WILLIAMSONI": Assets.graphics.fish.mountainWhitefish.path,
    "FISH:RUTILUS_RUTILUS": Assets.graphics.fish.roach.path,
    "FISH:ONCORHYNCHUS_MYKISS": Assets.graphics.fish.rainbowTrout.path,
    "FISH:LABEO_UMBRATUS": Assets.graphics.fish.moggel.path,
    "FISH:SCAPHIRHYNCHUS_PLATORYNCHUS": Assets.graphics.fish.shovelnoseSturgeon.path,
    "FISH:CLARIAS_GARIEPINUS": Assets.graphics.fish.africanSharptoothCatfish.path,
    "FISH:CHELON_RAMADA": Assets.graphics.fish.thinlipMullet.path,
    "FISH:SCARDINIUS_ERYTHROPHTHALMUS": Assets.graphics.fish.rudd.path,
    "FISH:PERCA_FLUVIATILIS": Assets.graphics.fish.europeanPerch.path,
    "FISH:LA_MOSTRENCA": Assets.graphics.fish.laMostrenca.path,
    "FISH:LABEOBARBUS_AENEUS": Assets.graphics.fish.smallmouthYellowfish.path,
    "FISH:LEPOMIS_CYANELLUS": Assets.graphics.fish.greenSunfish.path,
    "FISH:CHETIA_FLAVIVENTRIS": Assets.graphics.fish.canaryKurper.path,
    "FISH:SQUALIUS_CEPHALUS": Assets.graphics.fish.chub.path,
    "FISH:MICROPTERUS_PUNCTULATUS": Assets.graphics.fish.spottedBass.path,
    "FISH:CHELON_LABROSUS": Assets.graphics.fish.thicklipMullet.path,
    "FISH:LUCIOBARBUS_SCLATERI": Assets.graphics.fish.andalusianBarbel.path,
    "FISH:ESOX_MASQUINONGY": Assets.graphics.fish.tigerMuskie.path,
    "FISH:OREOCHROMIS_MOSSAMBICUS": Assets.graphics.fish.blueKurper.path,
    "FISH:ONCORHYNCHUS_MYKISS_AGUABONITA": Assets.graphics.fish.goldenTrout.path,
    "FISH:TINCA_TINCA": Assets.graphics.fish.tench.path,
    "FISH:CYPRINUS_CARPIO": Assets.graphics.fish.commonCarp.path,
    "FISH:EL_MATADOR": Assets.graphics.fish.elMatador.path,
    "FISH:ONCORHYNCHUS_CLARKII": Assets.graphics.fish.cutthroatTrout.path,
    "FISH:ALEJANDRO_MAGNO": Assets.graphics.fish.alejandroMagno.path,
    "FISH:SALVELINUS_FONTINALIS": Assets.graphics.fish.brookTrout.path,
    "FISH:KALLE_PAUL_THE_DOMINATOR": Assets.graphics.fish.kallePaulTheDominator.path,
    "FISH:LUCIOBARBUS_COMIZO": Assets.graphics.fish.comizoBarbel.path,
    "FISH:LEUCISCUS_LEUCISCUS": Assets.graphics.fish.commonDace.path,
    "FISH:SANDER_LUCIOPERCA": Assets.graphics.fish.zander.path,
    "FISH:SPEILFINNE": Assets.graphics.fish.speilfinne.path,
    "FISH:ESOX_LUCIUS": Assets.graphics.fish.northernPike.path,
    "FISH:SALMO_TRUTTA": Assets.graphics.fish.brownTrout.path,
    "FISH:LEUCISCUS_ASPIUS": Assets.graphics.fish.asp.path,
    "FISH:CYPRINUS_CARPIO_CARPIO": Assets.graphics.fish.mirrorCarp.path,
    "FISH:SIDEWINDER": Assets.graphics.fish.sidewinder.path,
    "FISH:SALMO_LETNICA": Assets.graphics.fish.ohridTrout.path,
    "FISH:LABEO_ALTIVELIS": Assets.graphics.fish.rednoseLabeo.path,
    "FISH:SANDER_VITREUS": Assets.graphics.fish.walleye.path,
    "FISH:STORE_HENRIK": Assets.graphics.fish.storeHenrik.path,
    "FISH:CARASSIUS_CARASSIUS": Assets.graphics.fish.crucianCarp.path,
    "FISH:COPTODON_RENDALLI": Assets.graphics.fish.redbreastKurper.path,
    "FISH:ABRAMIS_BRAMA": Assets.graphics.fish.bream.path,
    "FISH:BIG_LARRY": Assets.graphics.fish.bigLarry.path,
    "FISH:POMOXIS_NIGROMACULATUS": Assets.graphics.fish.blackCrappie.path,
    "FISH:COTTUS_POECILOPUS": Assets.graphics.fish.alpineBullhead.path,
    "FISH:LABEOBARBUS_KIMBERLEYENSIS": Assets.graphics.fish.largemouthYellowfish.path,
    "FISH:GYMNOCEPHALUS_CERNUA": Assets.graphics.fish.ruffe.path,
    "FISH:LABEO_CONGORO": Assets.graphics.fish.purpleLabeo.path,
    "FISH:POMOXIS_ANNULARIS": Assets.graphics.fish.whiteCrappie.path,
    "FISH:AMBLOPLITES_RUPESTRIS": Assets.graphics.fish.rockBass.path,
    "FISH:APLODINOTUS_GRUNNIENS": Assets.graphics.fish.freshwaterDrum.path,
    "FISH:SILURUS_GLANIS": Assets.graphics.fish.welsCatfish.path,
    "FISH:GROOTSLANG": Assets.graphics.fish.grootslang.path,
    "FISH:KAROO_MERMAID": Assets.graphics.fish.karooMermaid.path,
    "FISH:MAMLAMBO": Assets.graphics.fish.mamlambo.path
  };

  static String getTechniqueIcon(TechniqueType techniqueType) {
    switch (techniqueType) {
      case TechniqueType.constant:
        return Assets.graphics.images.techniqueConstant.path;
      case TechniqueType.twitching:
        return Assets.graphics.images.techniqueTwitching.path;
      case TechniqueType.jigging:
        return Assets.graphics.images.techniqueJigging.path;
      case TechniqueType.stopAndGo:
        return Assets.graphics.images.techniqueStopandgo.path;
    }
  }

  static String getProcessIcon(ProcessType process) {
    switch (process) {
      case ProcessType.success:
        throw UnimplementedError();
      case ProcessType.error:
        throw UnimplementedError();
      case ProcessType.info:
        throw UnimplementedError();
    }
  }

  static String getReserve(String id) {
    return _reserve[id]!;
  }

  static String getFish(String id) {
    return _fish[id]!;
  }
}
