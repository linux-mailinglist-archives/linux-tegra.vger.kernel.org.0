Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B853E748068
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jul 2023 11:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjGEJGZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jul 2023 05:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjGEJGY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 05:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF86110FB
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 02:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688547939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FkUdoB9ukiXu+GwQPoh7yLjinOj86HTx0mJIEOcNqHk=;
        b=XF2Ty5+4s9gCoV8n7LHDoERopxwpo86Ru71klVOgsVxem42AWvqjL4FWU5cuNfpp4ZcgGJ
        +Gj+zebDnCrm9a2VVpf9BShSfLHI0tEDWaK9b0Hnl350HBR197RlLimghqxXqI77MDnhtg
        eUCJ2C7y9G03mXz01L0MP9koQZrdso8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-OxJMakPlPG6kp-zaRlTe-A-1; Wed, 05 Jul 2023 05:05:37 -0400
X-MC-Unique: OxJMakPlPG6kp-zaRlTe-A-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fa9a282fffso37737665e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 02:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688547937; x=1691139937;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkUdoB9ukiXu+GwQPoh7yLjinOj86HTx0mJIEOcNqHk=;
        b=DGyourdr4EaUQVuFoqpAVa6yGDOA4EjqUCXFhOzt7XhYKJMplrZGaL3rC1eOWt1DZp
         q6eTkUovBFNfTR17LZkMz5QK3lAy71qT8EIGAZFV+mJlPndoYfGFhUp4XJpBH2TK9oQF
         mqENJT++a3ZMUGHULItPvJw5WW9xETS42Zt3/KjkTeHPDkMYCROq7eJ5S4Qnin9NWKaX
         GU2/9KZKCArL+xp5WjfQ98w/29do9OV06xzmHkoqmrg2HVIm4xUR2LqfFRjrvy+dlXhO
         0ezlVlSx77FAe5jmkMpc8UCcbYcRfXFUgwFmjuOcmF6KgqkwK25ksoiVV/dgn7Tw3i0B
         25Rw==
X-Gm-Message-State: ABy/qLaPUvfJZY79pk0CP4Y2cNKsQ1lreSTnMTbn7NHyjOrKhDLOIt/I
        E3x4UO2/8GWtd80HY01CVgfmhiF1ng2sFvo5jVH/ksM4mfG83HGLiCFJ6XPF1VvMJCYqVFnP7yu
        BZlm+am4fr728DaGpkg8L/oA=
X-Received: by 2002:a1c:f712:0:b0:3fb:dbd0:a7ea with SMTP id v18-20020a1cf712000000b003fbdbd0a7eamr6291385wmh.37.1688547936823;
        Wed, 05 Jul 2023 02:05:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFea/9ghtylfsKDHnVQCxTc0bPKyrA8WH7Zc8b8ay9vM+p1C9BZYAjxS62tSMn7FBeqBkEyEw==
X-Received: by 2002:a1c:f712:0:b0:3fb:dbd0:a7ea with SMTP id v18-20020a1cf712000000b003fbdbd0a7eamr6291366wmh.37.1688547936580;
        Wed, 05 Jul 2023 02:05:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k7-20020a05600c0b4700b003f9b155b148sm1517462wmr.34.2023.07.05.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:05:36 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 08/10] drm/omapdrm: Use GEM mmap for fbdev emulation
In-Reply-To: <20230704160133.20261-9-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-9-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 11:05:35 +0200
Message-ID: <87lefuran4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The fbdev emulation currently uses fbdev's default mmap code, which
> has been written for I/O memory. Provide an mmap that uses GEM's mmap
> infrastructure.
>
> Utilize fine-grained fbdev macros to initialize struct fb_ops. The
> macros set the read/write and the draw callbacks for DMA memory. Set
> the fb_mmap callback to omapdrm's new mmap helper. Also select the
> correct Kconfig token for fbdev's DMA helpers. Note that the DMA
> helpers are the same as for system memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

