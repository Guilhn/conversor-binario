package br.edu.utfpr.conversor_binario.model.mapper;

import br.edu.utfpr.conversor_binario.model.domain.Converter;
import br.edu.utfpr.conversor_binario.model.dto.ConverterDTO;

public class ConverterMapper {

    public static Converter toEntity(ConverterDTO dto){
        Converter entity = new Converter(dto.getDecimal(), dto.getBinary());
        return entity;
    }

    public static ConverterDTO toDTO(Converter entity){
        ConverterDTO dto = new ConverterDTO(entity.getDecimal(), entity.getBinary());
        return dto;
    }

}
