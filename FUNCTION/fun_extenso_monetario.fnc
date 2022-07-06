create or replace function fun_extenso_monetario
(
  pinValor IN     NUMBER
)
return VARCHAR2
is
  --
  vsValorExtenso VARCHAR2(500);
  vsValorConv    VARCHAR2(25);
  vnInd          NUMBER;
  vsDigitos      VARCHAR2(3);
  vsTexto        VARCHAR2(500);
  --
BEGIN
  --
  vsValorConv := to_char(trunc((abs(pinValor) * 100),0) , '0999999999999999999' );
  vsValorConv := substr(vsValorConv, 1, 18)||'0'||substr(vsValorConv, 19, 2);
  --
  if to_number(vsValorConv) = 0 then
    --
    return('ZERO');
    --
  end if;
  --
  for vnInd in 1..7 loop
    --
    vsDigitos := substr(vsValorConv,(((vnInd-1)*3)+1), 3);
    vsTexto   := '' ;
    --
    -- EXTENSO PARA CENTENA
    --
    if substr(vsDigitos, 1, 1) = '2' then
      --
      vsTexto := vsTexto || 'DUZENTOS ';
      --
    elsif substr(vsDigitos, 1, 1) = '3' then
      --
      vsTexto := vsTexto || 'TREZENTOS ';
      --
    elsif substr(vsDigitos, 1, 1) = '4' then
      --
      vsTexto := vsTexto || 'QUATROCENTOS ';
      --
    elsif substr(vsDigitos,1,1) = '5' then
      --
      vsTexto := vsTexto || 'QUINHENTOS ';
      --
    elsif substr(vsDigitos,1,1) = '6' then
      --
      vsTexto := vsTexto || 'SEISCENTOS ';
      --
    elsif substr(vsDigitos,1,1) = '7' then
      --
      vsTexto := vsTexto || 'SETECENTOS ';
      --
    elsif substr(vsDigitos,1,1) = '8' then
      --
      vsTexto := vsTexto || 'OITOCENTOS ';
      --
    elsif substr(vsDigitos,1,1) = '9' then
      --
      vsTexto := vsTexto || 'NOVECENTOS ';
      --
    end if;
    --
    if substr(vsDigitos, 1, 1) = '1' then
      --
      if substr(vsDigitos, 2, 2) = '00' then
        --
        vsTexto := vsTexto || 'CEM ';
        --
      else
        --
        vsTexto := vsTexto || 'CENTO ';
        --
      end if;
      --
    end if;
    --
    -- EXTENSO PARA DEZENA
    --
    if substr(vsDigitos, 2, 1) <> '0' and vsTexto is not null then
      --
      vsTexto := vsTexto || 'E ';
      --
    end if;
    --
    if substr(vsDigitos, 2, 1) = '2' then
      --
      vsTexto := vsTexto ||'VINTE ';
      --
    elsif substr(vsDigitos, 2, 1) = '3' then
      --
      vsTexto := vsTexto ||'TRINTA ';
      --
    elsif substr(vsDigitos, 2, 1) = '4' then
      --
      vsTexto := vsTexto ||'QUARENTA ';
      --
    elsif substr(vsDigitos, 2, 1) = '5' then
      --
      vsTexto := vsTexto ||'CINQUENTA ';
      --
    elsif substr(vsDigitos, 2, 1) = '6' then
      --
      vsTexto := vsTexto ||'SESSENTA ';
      --
    elsif substr(vsDigitos, 2, 1) = '7' then
      --
      vsTexto := vsTexto ||'SETENTA ';
      --
    elsif substr(vsDigitos, 2, 1) = '8' then
      --
      vsTexto := vsTexto ||'OITENTA ';
      --
    elsif substr(vsDigitos, 2, 1) = '9' then
      --
      vsTexto := vsTexto ||'NOVENTA ';
      --
    end if;
    --
    if substr(vsDigitos, 2, 1) = '1' then
      --
      if substr(vsDigitos, 3, 1) <> '0' then
        --
        if substr(vsDigitos, 3, 1) = '1' then
          --
          vsTexto := vsTexto ||'ONZE ';
          --
        elsif substr(vsDigitos, 3, 1) = '2' then
          --
          vsTexto := vsTexto ||'DOZE ';
          --
        elsif substr(vsDigitos, 3, 1) = '3' then
          --
          vsTexto := vsTexto ||'TREZE ';
          --
        elsif substr(vsDigitos, 3, 1) = '4' then
          --
          vsTexto := vsTexto ||'QUATORZE ';
          --
        elsif substr(vsDigitos, 3, 1) = '5' then
          --
          vsTexto := vsTexto ||'QUINZE ';
          --
        elsif substr(vsDigitos, 3, 1) = '6' then
          --
          vsTexto := vsTexto ||'DEZESSEIS ';
          --
        elsif substr(vsDigitos, 3, 1) = '7' then
          --
          vsTexto := vsTexto ||'DEZESSETE ';
          --
        elsif substr(vsDigitos, 3, 1) = '8' then
          --
          vsTexto := vsTexto ||'DEZOITO ';
          --
        elsif substr(vsDigitos, 3, 1) = '9' then
          --
          vsTexto := vsTexto ||'DEZENOVE ';
          --
        end if;
        --
      else
        --
        vsTexto := vsTexto ||'DEZ ' ;
        --
      end if;
      --
    else
      --
      -- EXTENSO PARA UNIDADE
      --
      if substr(vsDigitos, 3, 1) <> '0' and vsTexto is not null then
        --
        vsTexto := vsTexto || 'E ';
        --
      end if;
      --
      if substr(vsDigitos, 3, 1) = '1' then
        --
        vsTexto := vsTexto ||'UM ';
        --
      elsif substr(vsDigitos, 3, 1) = '2' then
        --
        vsTexto := vsTexto ||'DOIS ';
        --
      elsif substr(vsDigitos, 3, 1) = '3' then
        --
        vsTexto := vsTexto ||'TRES ';
        --
      elsif substr(vsDigitos, 3, 1) = '4' then
        --
        vsTexto := vsTexto ||'QUATRO ';
        --
      elsif substr(vsDigitos, 3, 1) = '5' then
        --
        vsTexto := vsTexto ||'CINCO ';
        --
      elsif substr(vsDigitos, 3, 1) = '6' then
        --
        vsTexto := vsTexto ||'SEIS ';
        --
      elsif substr(vsDigitos, 3, 1) = '7' then
        --
        vsTexto := vsTexto ||'SETE ';
        --
      elsif substr(vsDigitos, 3, 1) = '8' then
        --
        vsTexto := vsTexto ||'OITO ';
        --
      elsif substr(vsDigitos, 3, 1) = '9' then
        --
        vsTexto := vsTexto ||'NOVE ';
        --
      end if;
      --
    end if;
    --
    if to_number( vsDigitos ) > 0 then
      --
      if to_number( vsDigitos ) = 1 then
        --
        if vnInd = 1 then
          --
          vsTexto := vsTexto || 'QUATRILHÃO ' ;
          --
        elsif vnInd = 2 then
          --
          vsTexto := vsTexto || 'TRILHÃO ' ;
          --
        elsif vnInd = 3 then
          --
          vsTexto := vsTexto || 'BILHÃO ' ;
          --
        elsif vnInd = 4 then
          --
          vsTexto := vsTexto || 'MILHÃO ' ;
          --
        elsif vnInd = 5 then
          --
          vsTexto := vsTexto || 'MIL ' ;
          --
        end if;
        --
      else
        --
        if vnInd = 1 then
          --
          vsTexto := vsTexto || 'QUATRILHÕES ' ;
          --
        elsif vnInd = 2 then
          --
          vsTexto := vsTexto || 'TRILHÕES ' ;
          --
        elsif vnInd = 3 then
          --
          vsTexto := vsTexto || 'BILHÕES ' ;
          --
        elsif vnInd = 4 then
          --
          vsTexto := vsTexto || 'MILHÕES ' ;
          --
        elsif vnInd = 5 then
          --
          vsTexto := vsTexto || 'MIL ' ;
          --
        end if;
        --
      end if;
      --
    end if;
    --
    vsValorExtenso := vsValorExtenso || vsTexto;
    --
    -- ESCRITA DA MOEDA CORRENTE
    --
    if vnInd = 5 then
      --
      if to_number(substr(vsValorConv, 16, 3)) > 0 and vsValorExtenso is not null then
        --
        vsValorExtenso := rtrim(vsValorExtenso) || ', ';
        --
      end if;
      --
    else
      --
      if vnInd < 5 and vsValorExtenso is not null then
        --
        vsValorExtenso := rtrim(vsValorExtenso) || ', ';
        --
      end if;
      --
    end if;
    --
    if vnInd = 6 then
      --
      if to_number(substr( vsValorConv, 1, 18)) > 1 then
        --
        vsValorExtenso := vsValorExtenso || 'REAIS ';
        --
      elsif to_number(substr(vsValorConv, 1, 18 )) = 1 then
        --
        vsValorExtenso := vsValorExtenso || 'REAL ';
        --
      end if;
      --
      if to_number(substr(vsValorConv, 20, 2)) > 0 and length(vsValorExtenso) > 0 then
        --
        vsValorExtenso := vsValorExtenso || 'E ';
        --
      end if;
      --
    end if;
    --
    -- ESCRITA PARA CENTAVOS
    --
    if vnInd = 7 then
      --
      if to_number(substr(vsValorConv, 20, 2)) > 1 then
        --
        vsValorExtenso := vsValorExtenso || 'CENTAVOS ';
        --
      elsif to_number(substr(vsValorConv, 20, 2)) = 1 then
        --
        vsValorExtenso := vsValorExtenso || 'CENTAVO ';
        --
      end if;
      --
    end if;
    --
  end loop;
  --
  return (rtrim(vsValorExtenso));
  --
exception
  --
  when others then
    --
    return ( '*** VALOR INVALIDO ***' );
    --
  --
end;
/
