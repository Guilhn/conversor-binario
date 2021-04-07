package br.edu.utfpr.conversor_binario.service;

import br.edu.utfpr.conversor_binario.model.dao.ConverterDAO;
import br.edu.utfpr.conversor_binario.model.domain.Converter;


public class ConverterService extends AbstractService<Long, Converter>{

    public ConverterService() {
        dao = new ConverterDAO();
    }

    public String converterDecToBin(int decimal){

        String bin = "";
        while(decimal > 0){
            if(decimal%2==0)
                bin = "0" + bin;
            else
                bin = "1" + bin;
            decimal /= 2;
        }
        return bin;
    }

    public String converterBinToDec(String bin){

        int size = bin.length();

        int potencia = 0;
        int decimal = 0;
        for(int i = size -1; i >= 0; i--) {
            decimal += Math.pow(2, potencia) * Character.getNumericValue(bin.charAt(i));
            potencia++;
        }
        return Integer.toString(decimal);

    }

}
