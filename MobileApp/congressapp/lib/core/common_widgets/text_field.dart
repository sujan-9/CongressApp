import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _model.emailAddressController,
      // focusNode: _model.emailAddressFocusNode,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Email Address',
        //labelStyle: FlutterFlowTheme.of(context).bodyMedium,
        hintText: 'Enter your email here...',
        // hintStyle: FlutterFlowTheme.of(context).bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(0, 22, 11, 175),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(0, 10, 20, 125),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(204, 39, 152, 17),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(204, 200, 30, 30),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(204, 200, 30, 30),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: const Color.fromARGB(204, 188, 188, 188),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
      ),
      // style: FlutterFlowTheme.of(context).bodySmall,
      // validator: _model.emailAddressControllerValidator.asValidator(context),
    );
  }
}

// Generated code for this emailA
