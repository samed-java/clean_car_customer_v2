// import 'package:coinbud/constants/keys/roles.dart';
//
// import '../../../constants/res/asset_manager.dart';
// import '../../../features/global/boarding/data/object_model/object_model.dart';
//
// extension UserRoleExtension on Roles {
//   List<OnboardingObjectModel> get onboarding {
//     List<Map<String, dynamic>> onboardingContent;
//     if (this == Roles.user) {
//       onboardingContent = [
//         {
//           "title": "The new NFT marketplace",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.buyNft
//         },
//         {
//           "title": "Get success in the crypto art",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.lockCoins
//         },
//         {
//           "title": "A new NFT experience",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.jackNft
//         },
//         {
//           "title": "Lowest fees in the market",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.glassMoney
//         },
//       ];
//     } else {
//       onboardingContent = [
//         {
//           "title": "The new NFT marketplace",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.buyNft
//         },
//         {
//           "title": "Get success in the crypto art",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.lockCoins
//         },
//         {
//           "title": "A new NFT experience",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.jackNft
//         },
//         {
//           "title": "Lowest fees in the market",
//           "subtitle":
//               "Node is a platform that aims to build a new creative economy.",
//           "image": ImageAssets.glassMoney
//         },
//       ];
//     }
//     return onboardingContent
//         .map<OnboardingObjectModel>((e) => OnboardingObjectModel.fromJson(e))
//         .toList();
//   }
// }
