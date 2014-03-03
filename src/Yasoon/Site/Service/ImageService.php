<?php
/**
 * Author: Alexandr Drozdov <bagzon@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Service;

use Symfony\Component\HttpFoundation\File\File;
use Yasoon\Site\ImageLibrary\ImageLib;
use JMS\DiExtraBundle\Annotation as DI;

/**
 * @DI\Service("yasoon.service.image")
 */
class ImageService
{
    /**
     * @param \Symfony\Component\HttpFoundation\File\File $img
     * @param string                                      $path
     *
     * @return string
     */
    public function resizeImage(File $img, $path)
    {
        $imageLib = new ImageLib();
        $imageLib->load($path . $img->getFilename());
        $outputImgName = md5($img->getFilename() . time()) . '.' .$img->getExtension();

        $imageLib->resizeImage(100, 100, array('crop', 'tr'), true);
        $imageLib->saveImage($path . $outputImgName, 100);

        return $outputImgName;
    }

    /**
     * @param \Symfony\Component\HttpFoundation\File\File $img
     * @param string                                      $path
     *
     * @return string
     */
    public function saveImg(File $img, $path)
    {
        $imageLib = new ImageLib();
        $imageLib->load($path . $img->getFilename());
        $outputImgName = md5($img->getFilename() . time()) . '.' .$img->getExtension();

        //$imageLib->resizeImage(100, 100, array('crop', 'tr'), true);
        $imageLib->saveImage($path . $outputImgName, 100);

        return $outputImgName;
    }
}
