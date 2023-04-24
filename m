Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C43A6D98AE
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Apr 2023 15:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238767AbjDFNzX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Apr 2023 09:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237436AbjDFNzS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 09:55:18 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C4C7D9A
        for <linux-tegra@vger.kernel.org>; Thu,  6 Apr 2023 06:55:14 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50445d911c5so13762a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 06 Apr 2023 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680789313; x=1683381313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TQ0Ui67xq9CzYFnQjVu1GhWHxO5S7t6rxKa3UGx5Js=;
        b=cgWsCxeGAV6WXB8bUEfJ766LrYnsZIMTjrxbkaIgobYukLagkIaFVGSJoTlek5sMwu
         BdoJM3QeIRJxoi4cL9vtOPqEud7cY3FvPDO0oncMTRihltdYUVB43gIq3IPGSJGLESgO
         QLCilwCxtEbHlAo1rf4t9UW0rpfmTr8PXD1eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680789313; x=1683381313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TQ0Ui67xq9CzYFnQjVu1GhWHxO5S7t6rxKa3UGx5Js=;
        b=hdRAaEwmWSl9msU9BVdMP2g3KXYEYGUhvXYqm6+BcGaRhXELFuwj4CCDuKfLa1rhJ2
         JNQWokEVVOFvBXuDjiPHBVKhXTWx2W4mMV6h9Cm+u9paR8BaDSHtKrMD/GOKY4t3nwOL
         ZtA01mzVVi54tAaBOkpxhepOwqwvsNLmZVTqvXt4Oq+ouskrBDPDdFl35rvhcs3MSxf1
         AUvMimjnEX/LWtlgFyPjVV8Mn3kiIwNnEqYOZ1ZdjhRJWDe2270JZnRBNlmH4fAJHScM
         TLs6VaLjnyKTNr7phIRjVqQwSmn6HEI28YmFzXEtXgtPNyMNEgoaYvedOI+73fM78KYD
         vQFg==
X-Gm-Message-State: AAQBX9crzGdNDeGGRccw4Nyp4n5UA10yTA4DioINIsUk2iHQLao1zz+U
        mdc7xo7CXgs1Wma/PUd9Fwh26RrRBpAKLQVfWYY=
X-Google-Smtp-Source: AKy350Y69d0Ellt39POjvfSwpriUohxUE/pdiLOfoBCnmRHdmjyn+LgC2f21+5Ab/l3uyfSCxcH0BA==
X-Received: by 2002:a17:906:51cd:b0:931:5145:c51f with SMTP id v13-20020a17090651cd00b009315145c51fmr4724124ejk.4.1680789312753;
        Thu, 06 Apr 2023 06:55:12 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906bc4e00b0093338259b2bsm821477ejv.207.2023.04.06.06.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 06:55:12 -0700 (PDT)
Date:   Thu, 6 Apr 2023 15:55:10 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Dave Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] drm/tegra: Changes for v6.4-rc1
Message-ID: <ZC7PPvFL/rKwhakQ@phenom.ffwll.local>
References: <20230406121404.967704-1-thierry.reding@gmail.com>
 <ZC7EnnQZ0LBpC/cV@phenom.ffwll.local>
 <561c74a9-8fdf-568f-f5f2-d0c80d651ce0@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <561c74a9-8fdf-568f-f5f2-d0c80d651ce0@kapsi.fi>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 06, 2023 at 04:18:46PM +0300, Mikko Perttunen wrote:
> On 4/6/23 16:09, Daniel Vetter wrote:
> > On Thu, Apr 06, 2023 at 02:14:04PM +0200, Thierry Reding wrote:
> > > Hi Dave, Daniel,
> > > 
> > > The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:
> > > 
> > >    Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.4-rc1
> > > 
> > > for you to fetch changes up to 2429b3c529da29d4277d519bd66d034842dcd70c:
> > > 
> > >    drm/tegra: Avoid potential 32-bit integer overflow (2023-04-06 14:02:33 +0200)
> > > 
> > > Thanks,
> > > Thierry
> > > 
> > > ----------------------------------------------------------------
> > > drm/tegra: Changes for v6.4-rc1
> > > 
> > > The majority of this is minor cleanups and fixes. Other than those, this
> > > contains Uwe's conversion to the new driver remove callback and Thomas'
> > > fbdev DRM client conversion. The driver can now also be built on other
> > > architectures to easy compile coverage.
> > 
> > Neat cleanup on top might be too look at the generic fbdev stuff, just as
> > an idea.
> > 
> > > Finally, this adds Mikko as a second maintainer for the driver. As a
> > > next step we also want Tegra DRM to move into drm-misc to streamline the
> > > maintenance process.
> > 
> > Amusingly the one patch that dim flagged as lacking a 2nd set of eyes (no
> > a-b/rb or committer!=author) is the MAINTAINERS patch, would have been
> > good to record Mikko's ack for getting volunteered :-)
> 
> Haha, admittedly I was a bit surprised to see myself being added to
> MAINTAINERS so quickly after talking about it with Thierry; but yes, I
> submit myself to the duty :)

Thanks for confirming! :-)

> 
> Cheers,
> Mikko
> 
> > 
> > Anyway all good, pulled, thanks!
> > 
> > > 
> > > ----------------------------------------------------------------
> > > Cai Huoqing (3):
> > >        drm/tegra: sor: Make use of the helper function dev_err_probe()
> > >        drm/tegra: dsi: Make use of the helper function dev_err_probe()
> > >        drm/tegra: plane: Improve use of dev_err_probe()
> > > 
> > > Christian K�nig (2):
> > >        drm/tegra: Allow compile test on !ARM v2
> > >        drm/tegra: Fix another missing include
> > > 
> > > Deepak R Varma (1):
> > >        drm/tegra: sor: Remove redundant error logging
> > > 
> > > Diogo Ivo (1):
> > >        drm/tegra: dsi: Clear enable register if powered by bootloader
> > > 
> > > Lee Jones (1):
> > >        drm/tegra: dc: Remove set but unused variable 'state'
> > > 
> > > Mikko Perttunen (1):
> > >        gpu: host1x: Don't rely on dma_fence_wait_timeout return value
> > > 
> > > Nur Hussein (1):
> > >        drm/tegra: Avoid potential 32-bit integer overflow
> > > 
> > > Thierry Reding (1):
> > >        MAINTAINERS: Add Mikko as backup maintainer for Tegra DRM
> > > 
> > > Thomas Zimmermann (7):
> > >        drm/tegra: Include <linux/of.h>
> > >        drm/tegra: Include <linux/i2c.h>
> > >        drm/tegra: Removed fb from struct tegra_fbdev
> > >        drm/tegra: Remove struct tegra_fbdev
> > >        drm/tegra: Hide fbdev support behind config option
> > >        drm/tegra: Initialize fbdev DRM client
> > >        drm/tegra: Implement fbdev emulation as in-kernel client
> > > 
> > > Uwe Kleine-K�nig (12):
> > >        gpu: host1x: Make host1x_client_unregister() return void
> > >        drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
> > >        drm/tegra: dc: Convert to platform remove callback returning void
> > >        drm/tegra: dpaux: Convert to platform remove callback returning void
> > >        drm/tegra: dsi: Convert to platform remove callback returning void
> > >        drm/tegra: gr2d: Convert to platform remove callback returning void
> > >        drm/tegra: gr3d: Convert to platform remove callback returning void
> > >        drm/tegra: hdmi: Convert to platform remove callback returning void
> > >        drm/tegra: hub: Convert to platform remove callback returning void
> > >        drm/tegra: nvdec: Convert to platform remove callback returning void
> > >        drm/tegra: sor: Convert to platform remove callback returning void
> > >        drm/tegra: vic: Convert to platform remove callback returning void
> > > 
> > > Yang Yingliang (2):
> > >        gpu: host1x: Fix potential double free if IOMMU is disabled
> > >        gpu: host1x: Fix memory leak of device names
> > > 
> > > Ye Xingchen (1):
> > >        gpu: host1x: mipi: Use devm_platform_get_and_ioremap_resource()
> > > 
> > >   MAINTAINERS                             |   1 +
> > >   drivers/gpu/drm/tegra/Kconfig           |   2 +-
> > >   drivers/gpu/drm/tegra/Makefile          |   2 +
> > >   drivers/gpu/drm/tegra/dc.c              |  22 +--
> > >   drivers/gpu/drm/tegra/dc.h              |   2 +-
> > >   drivers/gpu/drm/tegra/dpaux.c           |   6 +-
> > >   drivers/gpu/drm/tegra/drm.c             |  23 +--
> > >   drivers/gpu/drm/tegra/drm.h             |  27 ++--
> > >   drivers/gpu/drm/tegra/dsi.c             |  51 ++++---
> > >   drivers/gpu/drm/tegra/fb.c              | 242 +-------------------------------
> > >   drivers/gpu/drm/tegra/fbdev.c           | 241 +++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/tegra/gem.c             |   1 +
> > >   drivers/gpu/drm/tegra/gr2d.c            |  14 +-
> > >   drivers/gpu/drm/tegra/gr3d.c            |  14 +-
> > >   drivers/gpu/drm/tegra/hdmi.c            |  14 +-
> > >   drivers/gpu/drm/tegra/hub.c             |  13 +-
> > >   drivers/gpu/drm/tegra/nvdec.c           |  14 +-
> > >   drivers/gpu/drm/tegra/output.c          |   3 +
> > >   drivers/gpu/drm/tegra/plane.c           |  16 +--
> > >   drivers/gpu/drm/tegra/rgb.c             |   7 +-
> > >   drivers/gpu/drm/tegra/sor.c             |  44 ++----
> > >   drivers/gpu/drm/tegra/vic.c             |  14 +-
> > >   drivers/gpu/host1x/Kconfig              |   2 +-
> > >   drivers/gpu/host1x/bus.c                |   6 +-
> > >   drivers/gpu/host1x/context.c            |  24 ++--
> > >   drivers/gpu/host1x/mipi.c               |   4 +-
> > >   drivers/gpu/host1x/syncpt.c             |   8 +-
> > >   drivers/staging/media/tegra-video/csi.c |   8 +-
> > >   drivers/staging/media/tegra-video/vi.c  |   8 +-
> > >   include/linux/host1x.h                  |   2 +-
> > >   30 files changed, 370 insertions(+), 465 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/tegra/fbdev.c
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
