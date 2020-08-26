package com.service;

import com.domain.ExchangeRate;
import com.domain.History;
import com.neovisionaries.i18n.CurrencyCode;
import com.repository.ExchangeRepository;
import com.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


@Service
@EnableScheduling
public class ExchangeService{
    @Autowired
    private HistoryRepository historyRepository;

    @Autowired
    private ExchangeRepository exchangeRepository;

    @Bean
    @Scheduled(fixedRate = 24 * 60 * 60 * 1000)
    public void ShowExchangeRates(){


        if(!exchangeRepository.findAll().isEmpty()){
            exchangeRepository.deleteAll();
        }
    try
    {
        
        DocumentBuilderFactory factory;
        factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse("https://www.lb.lt/webservices/FxRates/FxRates.asmx/getCurrentFxRates?tp=EU");
        NodeList list = doc.getElementsByTagName("FxRate");

        for(int i=0; i<list.getLength(); i++){

            Node n = list.item(i);
            Element e = (Element)n;
            String tempCurrencyCode =e.getElementsByTagName("Ccy").item(1).getTextContent();




            for (CurrencyCode code : CurrencyCode.values())
            {
                String currencyName =String.format("%s",code.getCurrency());

                if(currencyName.equals(tempCurrencyCode)){

                    String letters = e.getElementsByTagName("Ccy").item(1).getTextContent();
                    String rate = e.getElementsByTagName("Amt").item(1).getTextContent();



                    exchangeRepository.save(new ExchangeRate((long) (i + 1),letters,rate,code.getName()));

                }
            }
        }
    }catch (Exception e){

        System.out.println(e.getMessage());
    }
}

public void ShowHistoryData( String name,String dateFrom, String dateTo){

        String date1 = dateFrom;
        String date2 = dateTo;

        if(date1.isEmpty() || date2.isEmpty()){

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            LocalDateTime now = LocalDateTime.now();
            date2=dtf.format(now);

            LocalDate dateMinusYear = LocalDate.now().minusYears(1);
            date1 = dtf.format(dateMinusYear);

        }


    if(!historyRepository.findAll().isEmpty()){
        historyRepository.deleteAll();
    }

    try
    {

        DocumentBuilderFactory factory;
        factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse("http://www.lb.lt/webservices/FxRates/FxRates.asmx/getFxRatesForCurrency?tp=Eu&ccy="+name+"&dtFrom="+date1+"&dtTo="+date2);

        NodeList list = doc.getElementsByTagName("FxRate");


        for(int i=0; i<list.getLength(); i++){

            Node n = list.item(i);
            Element e = (Element)n;

            String date = e.getElementsByTagName("Dt").item(0).getTextContent();
            String letters = e.getElementsByTagName("Ccy").item(1).getTextContent();
            String rate = e.getElementsByTagName("Amt").item(1).getTextContent();

            historyRepository.save(new History((long) (i + 1),letters,rate, date));

        }

    }catch (Exception e){

        System.out.println(e.getMessage());
    }
}


    public String CalculateSum(double rate, double number){

        DecimalFormat df = new DecimalFormat("#.##");
        String formatted = df.format(rate*number);

    return formatted;

}


}
