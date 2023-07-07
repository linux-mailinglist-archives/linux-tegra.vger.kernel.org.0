Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC90F74AE99
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Jul 2023 12:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbjGGKOf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Jul 2023 06:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbjGGKOF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 06:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D805F30D6
        for <linux-tegra@vger.kernel.org>; Fri,  7 Jul 2023 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688724748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DlW1R/8hRwezlWgbC+wvZSXHhVUh/eG+VQMZJgN0Tvc=;
        b=TzYnI9s5JcszrVKky2QMsAwqLDqmVIzYsOQP9Vgvzug/CT+YkMRdTbgqfrB+XK6FUs2xgT
        fW2V1YOD/FXcRs7wlMK+fziefLnxFdeKHL/wyfDNmgPtfBwSsMAbmDqiQzD/1J22O1WsXQ
        IIc1f1BwsxGn0rZPNFhW7NtTmhqdbhk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-s8efgQ_SN_eNGbat1jdLEg-1; Fri, 07 Jul 2023 06:12:27 -0400
X-MC-Unique: s8efgQ_SN_eNGbat1jdLEg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3143c941d0bso946327f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 07 Jul 2023 03:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688724746; x=1691316746;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlW1R/8hRwezlWgbC+wvZSXHhVUh/eG+VQMZJgN0Tvc=;
        b=RQo7B3zVAGFzTDC7m34U/IM6/yi4O7zuYUSBoRPnP/812P6em2A9CKhjlzkOm2fbNT
         wCFRnoO0dn6cbU2VjNRJb9QHAh40/lWooB+vY1mq7SpjzQLEXdoVJAjtDRFK8t+qOK/n
         5Iu9ji9tO2EeBbJAUwa/ls5s+NVVfcPUFXWz3tXUbGJt9SqTdALd7VbtoPCfozJ72rRj
         CqnBxtu/tefVK/k46lakhWHh8ac6cxCCpfL4jbPkyBILmWBdlwcfE0toICukQVsInMFG
         cKywPbkkLAjIAOQcytTTPPAWAsniMqjgUGe82fzaYSJHBurbzPdAyIx9S9MytoAIWR/L
         kgmQ==
X-Gm-Message-State: ABy/qLbIcZfa543yLGndbG1o8yYAL0I0ESgVe6sllXwAKVXJgyAD+zyi
        m8eDvMb/LGRV5zfJ9ezT5xFB0K29UwISags4lkIpjTaWCmDUwh7NIHxrmms+6oBolWbhltj5mjZ
        5qgx5odSZ5+PVzjkcEaqO/vA=
X-Received: by 2002:adf:e40b:0:b0:313:f02f:be7f with SMTP id g11-20020adfe40b000000b00313f02fbe7fmr3429140wrm.55.1688724746547;
        Fri, 07 Jul 2023 03:12:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEl0rRQx8YRJhH9y3kGM2crHvIosSMl2yPsiQFeLRX1mWJpZ5P5lO4jWKSG6bWALHyxhssqPQ==
X-Received: by 2002:adf:e40b:0:b0:313:f02f:be7f with SMTP id g11-20020adfe40b000000b00313f02fbe7fmr3429126wrm.55.1688724746175;
        Fri, 07 Jul 2023 03:12:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m5-20020adfe945000000b00313f9085119sm4031028wrn.113.2023.07.07.03.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 03:12:25 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 05/12] drm/tegra: Store pointer to vmap'ed
 framebuffer in screen_buffer
In-Reply-To: <20230707083422.18691-6-tzimmermann@suse.de>
References: <20230707083422.18691-1-tzimmermann@suse.de>
 <20230707083422.18691-6-tzimmermann@suse.de>
Date:   Fri, 07 Jul 2023 12:12:19 +0200
Message-ID: <87pm54xc70.fsf@minerva.mail-host-address-is-not-set>
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

> Tegra uses DMA-able memory, which has to be acessed with CPU ops
> for system-memory. Store the framebuffer's vmap address in struct
> fb_info.screen_buffer. The currently used field 'screen_base' is
> for I/O memory.
>
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

