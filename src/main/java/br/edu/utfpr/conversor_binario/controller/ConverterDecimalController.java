package br.edu.utfpr.conversor_binario.controller;
import br.edu.utfpr.conversor_binario.service.ConverterService;
import br.edu.utfpr.conversor_binario.util.Constants;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;



@WebServlet(name = "ConverterController", value = "/decimal")
public class ConverterDecimalController extends HttpServlet {

    ConverterService converterService = new ConverterService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String decimal = request.getParameter("decimal");
        String city = request.getParameter("city");
        String type_conversion = "";

        //cookie global
        String cityName = (String) request.getServletContext().getAttribute(Constants.CITY_NAME);
        cityName = city;


        //cookie por sessão
        Integer counterConverterDec = (Integer) request.getSession(true).getAttribute(Constants.COUNTER_CONVERTER_DEC);
        if(counterConverterDec == null){
            counterConverterDec = 0;
        }


        request.setAttribute("flash.city", city);

        if (decimal != ""){
            Integer decimalInt = Integer.parseInt(decimal);
            String bin = converterService.converterDecToBin(decimalInt);
            type_conversion = "decimal";
            request.setAttribute("flash.type_conversion", type_conversion);
            request.setAttribute("flash.bin", bin);
            request.setAttribute("flash.dec", decimal);
            counterConverterDec++;
        }





        request.getSession(true).setAttribute(Constants.COUNTER_CONVERTER_DEC, counterConverterDec);
        Cookie cookie = new Cookie("counterDec", String.valueOf(counterConverterDec));
        Cookie url = new Cookie("url", String.valueOf("https://www.youtube.com/watch?v=kNH_EjHvm3I&ab_channel=HermTrololol"));
        url.setMaxAge(15);

        getServletContext().setAttribute(Constants.CITY_NAME, cityName);

        response.addCookie(cookie);
        response.addCookie(url);
        request.getRequestDispatcher("/binario").forward(request, response);
    }


}


