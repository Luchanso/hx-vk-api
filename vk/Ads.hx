package vk;

import openfl.events.Event;
import openfl.display.Loader;
import openfl.display.Sprite;
import openfl.net.URLRequest;
import openfl.system.ApplicationDomain;
import openfl.system.LoaderContext;
import openfl.system.SecurityDomain;

enum PositionType {
	HORIZONTAL;
	VERTICAL;
}

/**
 * ...
 * @author Loutchansky Oleg
 */
class Ads
{
	public static function init(callback : Dynamic = null) 
	{
		var loader = new Loader();
		var context = new LoaderContext(false, ApplicationDomain.currentDomain);
		context.securityDomain = SecurityDomain.currentDomain;

		loader.load(new URLRequest('//api.vk.com/swf/vk_ads.swf'), context);
		
		if (callback != null)
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, callback);
	}
	
	public static function create(id : String, x : Float, y : Float, width : Float, height : Float, flashVars : Dynamic, count : Int = 4, isTest : Bool = true, typePosition : PositionType = null)
	{
		var mainVKBanner = new com.vk.MainVKBanner(id);
		
		var params = new com.vk.vo.BannersPanelVO(); // создание класса параметров баннера
		
		if (typePosition == null) 
		{
			typePosition = PositionType.HORIZONTAL;
		}
		
		// изменение стандартных параметров:
		if (isTest) 
		{
			params.demo = '1'; // показывает тестовые баннеры
		} 
		else 
		{
			params.demo = '0'; 
		}
		
		// вертикальный (AD_TYPE_VERTICAL) или горизонтальный (AD_TYPE_HORIZONTAL) блок баннеров
		
		if (typePosition == PositionType.HORIZONTAL) 
		{
			params.ad_type = com.vk.vo.BannersPanelVO.AD_TYPE_HORIZONTAL;
			params.ad_unit_type = com.vk.vo.BannersPanelVO.AD_UNIT_TYPE_HORIZONTAL;
		} 
		else 
		{
			params.ad_type = com.vk.vo.BannersPanelVO.AD_TYPE_VERTICAL;
			params.ad_unit_type = com.vk.vo.BannersPanelVO.AD_UNIT_TYPE_VERTICAL;
		}
		
		params.ad_height = height;
		params.ad_width = width;
		
		params.ads_count = count;
		
		// mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_COMPLETE, banner_onLoad);
		// mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_IS_EMPTY, banner_onAdsEmpty);
		// mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_ERROR, banner_onError);
		
		mainVKBanner.initBanner(flashVars, params);

		mainVKBanner.x = x;
		mainVKBanner.y = y;
		
		return mainVKBanner;
	}
	

}