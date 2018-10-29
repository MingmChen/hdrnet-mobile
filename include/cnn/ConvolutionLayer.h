
#ifndef __CONVOLUTIONLAYER_H
#define __CONVOLUTIONLAYER_H

#include "cnn/BaseLayer.h"


class ConvolutionLayer: public BaseLayer
{
public:
    ConvolutionLayer(float * in, float * out, TensorShape in_shape, TensorShape out_shape, 
        int k_h, int k_w, int p_h, int p_w, int s_h, int s_w
        ) : BaseLayer(in, out, in_shape, out_shape), _kernel_h(k_h), _kernel_w(k_w), _pad_h(p_h), _pad_w(p_w), _stride_h(s_h), _stride_w(s_w)
    {
        // Initialization
    }

    int run() override;

public:
    int _kernel_h;
    int _kernel_w;
    int _pad_h;
    int _pad_w;
    int _stride_h;
    int _stride_w;
};



int ConvolutionLayer::run()
{
    LOGD("# ConvolutionLayer Run!\n");
    LOGD("--input shape: (%d, %d, %d, %d)\n", _input_shape.n, _input_shape.c, _input_shape.h, _input_shape.w);
    return 0;
}


#endif //__CONVOLUTIONLAYER_H