package eppn.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import eppn.common.common.CommandMap;
import eppn.sample.service.SampleService;

@Controller
public class SampleController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="sampleService")
    private SampleService sampleService;
    
    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardList");
        
        List<Map<String, Object>> list = sampleService.selectBoardList(commandMap);
        mv.addObject("list", list);
        
        return mv;
    }
    
    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/boardWrite");
         
        return mv;
    }
    
    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(CommandMap commandMap,HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
         
        sampleService.insertBoard(commandMap.getMap(), request);
         
        return mv;
    }
    
    @RequestMapping(value="/sample/testMapArgumentResover.do")
    public ModelAndView testManpArgumentResolver(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("");
    	
    	if(commandMap.isEmpty() == false){
    		Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
    		Entry<String, Object> entry = null;
    		while(iterator.hasNext()){
    			entry = iterator.next();
    			log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
    		}
    	}
		return mv;
    }
}

