package br.edu.utfpr.conversor_binario.controller;

import br.edu.utfpr.conversor_binario.model.dao.ConverterDAO;
import br.edu.utfpr.conversor_binario.model.domain.City;
import br.edu.utfpr.conversor_binario.model.domain.Converter;
import br.edu.utfpr.conversor_binario.service.ConverterService;
import br.edu.utfpr.conversor_binario.service.CityService;
import br.edu.utfpr.conversor_binario.util.JPAUtil;
import br.edu.utfpr.conversor_binario.util.Routes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ConverterResultController", urlPatterns = {"/criar", "/listar", "/editar", "/remover"})
public class ConverterResultController extends HttpServlet {

    ConverterService converterService = new ConverterService();
    CityService CityService = new CityService();
    ConverterDAO converterDAO = new ConverterDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      if (request.getServletPath().contains(Routes.DELETE)){
          Long delete = Long.parseLong(request.getParameter("id"));
          converterService.deleteById(delete);
          response.sendRedirect("/conversor-binario/listar");
        }else if(request.getServletPath().contains(Routes.UPDATE)){
            Long update = Long.parseLong(request.getParameter("id"));
            JPAUtil.closeEntityManager();
            Converter converter = converterService.getById(update);

            List<City> cities = CityService.findAll();

            request.setAttribute("converter", converter);
            request.setAttribute("cities", cities);
            request.getRequestDispatcher("/WEB-INF/view/converter-edit.jsp").forward(request, response);
        }else if (request.getServletPath().contains(Routes.READ)){
            JPAUtil.closeEntityManager();
            List<Converter> converter = converterDAO.findAll();

            request.setAttribute("converter", converter);

            PrintWriter out = response.getWriter();
            request.getRequestDispatcher("/WEB-INF/view/report.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getServletPath().contains(Routes.UPDATE)){
            Converter converter = new Converter();
            Long editar_id = Long.parseLong(request.getParameter("id"));
            Long city_id = Long.parseLong(request.getParameter("city"));

            converter = converterService.getById(editar_id);
            City city = CityService.getById(city_id);
            converter.setCity(city);
            converterService.update(converter);

            response.sendRedirect("listar");


        }else{
            if(request.getServletPath().contains(Routes.CREATE)){
                Converter converter = new Converter();
                City city = (City) request.getAttribute("flash.city");
                String decimal = (String) request.getAttribute("flash.dec");
                String binario = (String) request.getAttribute("flash.bin");
                String type_conversion = (String) request.getAttribute("flash.type_conversion");


                request.setAttribute("flash.city", city);
                request.setAttribute("flash.dec", decimal);
                request.setAttribute("flash.bin", binario);

                converter.setDecimal(decimal);
                converter.setBinary(binario);
                converter.setCity(city);
                converterService.save(converter);
                response.sendRedirect("/conversor-binario");
            }
        }
    }
}
