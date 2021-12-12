
                <div class="brand inline no-selection" id="<?php echo $brand_id; ?>">
                    <table class="cursor-pointer toggle-sidebar" data-toggle="">
                        <tr>
                            <td align="center"><?php $src = INDEX . "ui/pages/assets/img/" . $app_logo; ret(1); ?>
                                <img class="brand-logo" src="<?php echo $src; ?>" data-src="<?php echo $src; ?>" data-src-retina="<?php echo $src; ?>" alt="logo">
                            </td>
                            <td align="left">
                                <ul class="ul-condensed text-uppercase <?php echo $banner_text_class; ?>">
                                    <li class="brand-lgu-title"><?php echo LGU_TYPE;?> of</li>
                                    <li class="brand-lgu-name"><?php echo LGU_NAME; ?></li>
                                    <li class="brand-app-title-1"><?php echo APP_TITLE_1; ?></li>
                                    <li class="brand-app-title-2"><?php echo APP_TITLE_2; ?></li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                </div>

