package br.edu.utfpr.conversor_binario.controller;

import br.edu.utfpr.conversor_binario.model.domain.City;
import br.edu.utfpr.conversor_binario.service.CityService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet(name = "CityController", value = "/cidade")
public class CityController extends HttpServlet {

    CityService cityService = new CityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        City city = cityService.getByProperty("name", (String) request.getAttribute("flash.city"));
        String decimal = (String) request.getAttribute("flash.dec");
        String binario = (String) request.getAttribute("flash.bin");
        String type_conversion = (String) request.getAttribute("flash.type_conversion");

        request.setAttribute("flash.type_conversion", type_conversion);
        request.setAttribute("flash.dec", decimal);
        request.setAttribute("flash.bin", binario);
        request.setAttribute("flash.city", city);

        request.getRequestDispatcher("/criar").forward(request, response);


    }
}
