package com.controller;

import com.domain.ExchangeRate;
import com.domain.History;
import com.repository.ExchangeRepository;
import com.repository.HistoryRepository;
import com.service.ExchangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RateController {

    @Autowired
    ExchangeService exchangeService;

    @Autowired
    private ExchangeRepository exchangeRepository;

    @Autowired
    private HistoryRepository historyRepository;


    @GetMapping("/")
    public String index(){
        return "index";
    }

     @GetMapping("/showRates")
    public ModelAndView showRates(Model model){
         List<ExchangeRate> rates = this.exchangeRepository.findAll();
         Map<String, Object>  params = new HashMap<>();
         params.put("rates", rates);
         return new ModelAndView("showRates", params);
    }

    @RequestMapping("history/id={name}")
    public ModelAndView showHistory(Model model,@PathVariable(value="name") String name){
        exchangeService.ShowHistoryData(name,"","");

        List<History> history = this.historyRepository.findAll();
        Map<String, Object>  params = new HashMap<>();
        params.put("history", history);
        params.put("code", name);
        return new ModelAndView("showHistory", params);
    }

    @GetMapping("/exchange")
    public ModelAndView Exchange(Model model){
        List<ExchangeRate> rates = this.exchangeRepository.findAll();
        Map<String, Object>  params = new HashMap<>();
        params.put("rates", rates);
        return new ModelAndView("exchange", params);
    }

    @PostMapping("/exchange")
    public ModelAndView GetThisExchange(Model model,@RequestParam(value = "amount", required = false) double amount,
                                                    @RequestParam(value = "id", required = false) double code ){
        List<ExchangeRate> rates = this.exchangeRepository.findAll();
        Map<String, Object>  params = new HashMap<>();

        params.put("rates", rates);
        params.put("rate", code);
        params.put("amount", exchangeService.CalculateSum(code,amount));

        return new ModelAndView("exchange", params);
    }

    @PostMapping("history/id={name}")
    public ModelAndView SpecificDates(Model model, @PathVariable(value="name") String name,
                                                   @RequestParam(value = "dateFrom", required = false) String dateFrom,
                                                   @RequestParam(value = "dateTo", required = false) String dateTo ) {

        exchangeService.ShowHistoryData(name,dateFrom,dateTo);

        List<History> history = this.historyRepository.findAll();
        Map<String, Object>  params = new HashMap<>();
        params.put("history", history);

        return new ModelAndView("showHistory", params);
    }


}
