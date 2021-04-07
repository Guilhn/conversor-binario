package br.edu.utfpr.conversor_binario.controller;
import br.edu.utfpr.conversor_binario.service.ConverterService;
import br.edu.utfpr.conversor_binario.util.Constants;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "ConverterBinaryController", value = "/binario")
public class ConverterBinaryController extends HttpServlet {

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
        String binary = request.getParameter("binario");
        String decimal = (String) request.getAttribute("dec");
        String city = (String) request.getAttribute("flash.city");
        String type_conversion = "";

        Integer counterConverterBin = (Integer) request.getSession(true).getAttribute(Constants.COUNTER_CONVERTER_BIN);

        if(counterConverterBin == null){
            counterConverterBin = 0;
        }

        request.setAttribute("flash.city", city);


        if (binary != ""){
            decimal = converterService.converterBinToDec(binary);
            type_conversion = "binary";
            request.setAttribute("flash.type_conversion", type_conversion);
            request.setAttribute("flash.dec", decimal);
            request.setAttribute("flash.bin", binary);
            counterConverterBin++;
        }else {
            type_conversion = (String) request.getAttribute("flash.type_conversion");
            decimal = (String) request.getAttribute("flash.dec");
            binary = (String) request.getAttribute("flash.bin");
            request.setAttribute("flash.dec", decimal);
            request.setAttribute("flash.bin", binary);
        }


        request.getSession(true).setAttribute(Constants.COUNTER_CONVERTER_BIN, counterConverterBin);
        Cookie cookie = new Cookie("counterBin", String.valueOf(counterConverterBin));
        response.addCookie(cookie);


        request.getRequestDispatcher("/cidade").forward(request, response);
    }


}
