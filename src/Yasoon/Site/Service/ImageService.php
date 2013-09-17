<?php
/**
 * Author: Alexandr Drozdov <bagzon@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Service;

use Yasoon\ImageLibrary\ImageLib;
use JMS\DiExtraBundle\Annotation as DI;

/**
 * @DI\Service("yasoon.service.image")
 */
class ImageService
{
    /**
     * @param string $imgName
     * @param string $path
     *
     * @return string
     */
    public function resizeImage($imgName, $path)
    {
        $imageLib = new ImageLib();
        $imageLib->load($path . $imgName);
        $outputImgName = md5($imgName . time());

        $imageLib->resizeImage(100, 100, array('crop', 'tr'), true);
        $imageLib->saveImage($path . $outputImgName, 100);

        return $outputImgName;
    }
}
