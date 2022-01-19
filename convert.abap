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
  
  
  
  
  
*  FUNCTION zca_call_in_v2
*  IMPORTING
*    VALUE(iv_exit) TYPE exitsname
*    VALUE(it_data) TYPE zca_wrapper_tt.
*
*
*
*
*
*
**** ATENTION: Class should inherit class ZCLCA_V2_MASTER ***
*
*  CONSTANTS: lc_param_data TYPE abap_parmname VALUE 'IT_DATA'.
*
*  "Get exits class and methods for exit name
*  zclca_fixedvals=>get_exits( EXPORTING
*                                iv_bukrs = space
*                                iv_ename = iv_exit
*                              IMPORTING
*                                et_exits = DATA(lt_exits)
*                              EXCEPTIONS
*                                no_data  = 1
*                                OTHERS   = 2
*                             ).
*  CHECK sy-subrc IS INITIAL.
*
*  "Fill parameter table and dynamically call the class/method
*  LOOP AT lt_exits ASSIGNING FIELD-SYMBOL(<fs_exit>).
*    DATA(lt_partab) = VALUE abap_parmbind_tab( ( name  = lc_param_data
*                                                 kind  = cl_abap_objectdescr=>exporting
*                                                 value = REF #( it_data[] ) )
*                                                ).
*
*    TRY.
*        DATA: lo_class TYPE REF TO object.
*
*        CREATE OBJECT lo_class TYPE (<fs_exit>-class)
*          PARAMETER-TABLE lt_partab.
*        CALL METHOD lo_class->(<fs_exit>-mthod).
*
**        CALL METHOD (<fs_exit>-class)=>(<fs_exit>-mthod)
**          PARAMETER-TABLE lt_partab.
*
*      CATCH cx_root INTO DATA(lo_error).
*        DATA(lv_mess) = lo_error->get_text( ).
*
*    ENDTRY.
*
*  ENDLOOP.
*
*ENDFUNCTION.
