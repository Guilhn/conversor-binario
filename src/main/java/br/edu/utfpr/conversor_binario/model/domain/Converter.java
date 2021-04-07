package br.edu.utfpr.conversor_binario.model.domain;

import lombok.*;
import javax.persistence.*;

@Entity
@Table(name = "conversions")
@Data
@NoArgsConstructor
@RequiredArgsConstructor(access = AccessLevel.PUBLIC)
public class Converter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull @Column(name = "number_decimal")
    private String decimal;

    @NonNull @Column(name = "number_binary")
    private String binary;

    @ManyToOne
    private City city;
}
