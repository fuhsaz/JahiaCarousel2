$(document).ready(function(){
  console.log("ready");
  $('.carouselMain').each(function(){
    var curID = $(this).attr('id');
    /* JS Object to hold the settings for the carousel */
    var settings = {};
    /* variables to hold each setting, passed to owlCarousel function through the settings object */
    var items;
    var singleItem;
    var autoPlay;
    var navigation;
    var pagination;
    var paginationNumbers;
    
    /* ===========   Number of items onscreen   ================= */
    /* Number of items at max display size */
    searchString = getSS(curID, 'Items');
    var itemsInput = $(searchString).text();
    if (!itemsInput.localeCompare('none')==0) {
      items = parseInt(itemsInput);
      settings.items = items;
    }
    /* Change default desktop lower bound or number of items */
    var sizeChanged = $(getSS(curID, 'ChangeDesktopSize')).text();
    var itemChanged = $(getSS(curID, 'ChangeDesktopItemNumber')).text();
    var newDesktopSize = parseInt(sizeChanged);
    var newDesktopItem = parseInt(itemChanged);
    var newDesktopSizeArray = [newDesktopSize, newDesktopItem];
    settings.itemsDesktop = newDesktopSizeArray;
    
    /* Change default small desktop lower bound or number of items */
	var sizeSmallChanged = $(getSS(curID, 'ChangeSmallDesktopSize')).text();
    var itemSmallChanged = $(getSS(curID, 'ChangeSmallDesktopItemNumber')).text();
    var newSmallDesktopSize = parseInt(sizeSmallChanged);
    var newSmallDesktopItem = parseInt(itemSmallChanged);
    var newSmallDesktopSizeArray = [newSmallDesktopSize, newSmallDesktopItem];
    settings.itemsDesktopSmall = newSmallDesktopSizeArray;
    
    /* Change default tablet lower bound or number of items */
	var sizeTabletChanged = $(getSS(curID, 'ChangeTabletSize')).text();
    var itemTabletChanged = $(getSS(curID, 'ChangeTabletItemNumber')).text();
    var newTabletSize = parseInt(sizeTabletChanged);
    var newTabletItem = parseInt(itemTabletChanged);
    var newTabletSizeArray = [newTabletSize, newTabletItem];
    settings.itemsTablet = newTabletSizeArray;
    
    /* Change default small tablet lower bound or number of items */
    /* First check if anything was even changed, because the default is false */
    var output = $(getSS(curID, 'SmallTabletChanged')).text();
    if (output.localeCompare('false')==0) {
     	var newSmallTabletSizeArray = false; 
    } else {
		var sizeSmallTabletChanged = $(getSS(curID, 'ChangeSmallTabletSize')).text();
    	var itemSmallTabletChanged = $(getSS(curID, 'ChangeSmallTabletItemNumber')).text();
    	var newSmallTabletSize = parseInt(sizeSmallTabletChanged);
    	var newSmallTabletItem = parseInt(itemSmallTabletChanged);
    	var newSmallTabletSizeArray = [newSmallTabletSize, newSmallTabletItem];
    }
    settings.itemsTabletSmall = newSmallTabletSizeArray;
    
    /* Option to display only a single item */
    var tempSingle = $(getSS(curID, 'SingleItem')).text();
    if (!tempSingle.localeCompare('none')==0) {
      if (tempSingle.localeCompare('true') == 0) {
        singleItem = true;
      } else {
        singleItem = false;
      }
      settings.singleItem = singleItem;
    }
    
    /* ===========   Navigation Options   ================= */
    /* Autoplay */
    autoPlayTemp = $(getSS(curID, 'AutoPlay')).text();
    if (!autoPlayTemp.localeCompare('none') == 0) {
      if (autoPlayTemp.localeCompare('false') == 0) {
        autoPlay = false;
      } else {
        var autoPlayTime = parseInt(autoPlayTemp);
        autoPlay = autoPlayTime;
      }
      settings.autoPlay = autoPlay;
    }
    /* Enable/Disable Navigation Buttons */
    var tempNav = $(getSS(curID, 'Navigation')).text();
    if (!tempNav.localeCompare('none')==0) {
      if (tempNav.localeCompare('true') == 0) {
        navigation = true;
      } else {
        navigation = false;
      }
      settings.navigation = navigation;
    }
    
    /* ================== Pagination Options ======================== */
    /* Display/Hide pagination */
    /* Switched true/false in jsp file because the default is to show them */
    var tempPag = $(getSS(curID, 'Pagination')).text();
    console.log(tempPag);
    if (!tempPag.localeCompare('none')==0) {
      console.log('not none');
      if (tempPag.localeCompare('true') == 0) {
        pagination = true;
      } else {
        pagination = false;
      }
      settings.pagination = pagination;
    }
    /* Show pagination numbers */
    var tempPN = $(getSS(curID, 'PaginationNumbers')).text();
    if (!tempPN.localeCompare('none')==0) {
      if (tempPN.localeCompare('true') == 0) {
        paginationNumbers = true;
      } else {
        paginationNumbers = false;
      }
      settings.paginationNumbers = paginationNumbers;
    }
    
    
    /* Call the owlCarousel() method with the constructed settings object */
    console.log(settings);
    $(this).owlCarousel(settings);
    
  });
  
  
  
  /* To generate the '.carouselID .carouselDesiredVariable' selector for jquery */
  function getSS(id, varName){
    var ss = ".";
    ss += id;
    ss += " .carousel";
    ss += varName;
    return ss;
  };
  
  
  
  
});