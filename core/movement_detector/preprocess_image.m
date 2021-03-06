
function im_ = preprocess_image(im, meta)

    % turn it to single, resize it and subtract the mean image
    im_ = single(im);
    im_ = imresize(im_, meta.normalization.imageSize(1:2));
    im_ = bsxfun(@minus, im_, meta.normalization.averageImage);
    
    % Some networks requires the image to be a multiple of 32 pixels
    if meta.normalization.imageNeedsToBeMultiple
        sz = [size(im_,1), size(im_,2)] ;
        sz_ = round(sz / 32)*32 ;
        im_ = imresize(im_, sz_) ;
    else
        im_ = im_ ;
    end

end