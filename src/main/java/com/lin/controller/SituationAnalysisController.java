package com.lin.controller;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 功能概要：UserController
 * @author chenhuan
 * @since  2017年11月10日
 */
@Controller 
@RequestMapping("/user")
public class SituationAnalysisController extends BaseController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 显示首页
	 * @author chenhuan
	 * @since  2017年7月10日 
	 * @return
	 */
	@RequestMapping(value="/main")
	public String main(){
		return "mainView/main";
	}
	//start
	@RequestMapping(value="/start")
	public String start(){
		return "mainView/start";
	}
	
	/**
	 *  供电区域
	 *  @since 2017年7月10日 
	 * @return
	 */
	@RequestMapping(value="/gongdianquyu")
	public String chart(){
		
		return "SituationAnalysis/gongdianquyu";
	}
	
	/**
	 *  南岸供电区域概况
	 *  @since 2017年7月10日 
	 * @return
	 */
		@RequestMapping(value="/dianwanggaikuang")
		public String echart(){
			
			return "SituationAnalysis/dianwanggaikuang";
		}
	
	/**
	 *  网架联络
	 *  @since 2017年7月10日 
	 * @return
	 */
	@RequestMapping(value="/wangjialianluo")
	public String bootStrapTest1(){
		return "SituationAnalysis/wangjialianluo";
	}
	
	/**
	 *  网架分段
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/wangjiafenduan")
	public String touziANDxiaoyo(){
		return "SituationAnalysis/wangjiafenduan";
	}
	/**
	 *  线路负载
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/xianlufuzai")
	public String image(){
		return "SituationAnalysis/xianlufuzai";
	}
	//xiaoyiContract
	/**
	 *  指标概况
	 *  @since 2017年7月24日 
	 * @return
	 */
	@RequestMapping("/zhibiaogaikuang")
	public String xiaoyiContract(){
		return "SituationAnalysis/zhibiaogaikuang";
	}
	


	

    

    

	

    

}
