

class ServerConfiguration{

  static var domainName = "http://192.168.174.110:8000";

  static var register = "/api/post-registration";

  static var login = "/api/login";

  static var getProfileInfo = "/api/user/showِAllPropertyBelongUser";

  static var addRealEstate = "/api/user/insertRequstes";

  static var getHomePageInfo = "/api/bouth/getAllProperty";

  static var getPropertiesBindingRequests = "/api/user/getAllRequestsUser";

  static var deleteProperty  = "/api/user/destroyProperty/";

  static var updatePropertyPrice = "/api/user/update/";

  static var deletePropertyRequest  = "/api/user/destroyRequest/";

  static var addRatingToRealEstate  = "/api/user/addRating/";

  static var searchByAddress = "/api/bouth/searchByAddress/";

  static var filterBySize = "/api/bouth/searchByArea";

  static var filterByPrice = "/api/bouth/searchByPrice";

  static var addPropertyToFavorite = "/api/user/favorite-property/";

  static var deletePropertyFromFavorite = "/api/user/remove/";

  static var showPropertiesInFavorite = "/api/user/showFavoriteProperties";


  static var chargeWallet = "/api/user/addWattel";

  static var emptyWallet = "/api/user/emptyCharge";

  static var getChargeRequests = "/api/user/getWattel";

  static var getEmptyRequests = "/api/user/getEmptyWattel";

  static var buyFunction = "/api/user/solidity/";

  static var getPublicTransactions = "/api/bouth/getSolidity";

  static var getPrivateTransactions = "/api/user/getSolidityOfUser";

  static var addSuggetion = "/api/user/addSuggestion";

}