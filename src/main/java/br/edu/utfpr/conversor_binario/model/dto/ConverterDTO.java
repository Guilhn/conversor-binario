package br.edu.utfpr.conversor_binario.model.dto;

import lombok.Data;
import lombok.NonNull;

@Data
public class ConverterDTO {

    @NonNull
    private String decimal;

    @NonNull
    private String binary;


}
