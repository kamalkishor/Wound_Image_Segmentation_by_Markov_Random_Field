function dst = blur_image(src, covar)

dst = round( normrnd(src, sqrt(covar) .* ones(size(src))) );

dst(find(dst < 0)) = 0;
dst(find(dst > 255)) = 255;
end