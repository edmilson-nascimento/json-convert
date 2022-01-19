REPORT yteste MESSAGE-ID >0 .




CLASS zlocal DEFINITION .



  PUBLIC SECTION .

    METHODS set
      IMPORTING
        i_type TYPE string
        i_data TYPE any .

    METHODS get
      IMPORTING
        i_type TYPE string
      EXPORTING
        e_data TYPE any .

    METHODS generate_data
      RETURNING
        VALUE(rs_value) TYPE char10 .

ENDCLASS .


CLASS zlocal IMPLEMENTATION .

  METHOD set .
  ENDMETHOD .


  METHOD get .
  ENDMETHOD .


  METHOD generate_data .

    CLEAR rs_value .

    rs_value = |{ sy-uname } { sy-uzeit }| .


  ENDMETHOD .


ENDCLASS .



INITIALIZATION .


  DATA(lv_obj) = NEW zlocal( ) .

  IF ( lv_obj IS BOUND ) .

    " Gerando informacao aleatoria
    DATA(ls_data) = lv_obj->generate_data( ) .

    IF ( ls_data IS NOT INITIAL ) .
    ENDIF .

  ENDIF .
