Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F142E748078
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jul 2023 11:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbjGEJIg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jul 2023 05:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjGEJIf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 05:08:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E96C10D5
        for <linux-tegra@vger.kernel.org>; Wed,  5 Jul 2023 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688548071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qr/C5LtRvrDZoQId+bjsOh/ZaHhOujfRlisJ/yVhSwY=;
        b=UkLADN8es5IicEimAEAQzF1P1WWuT+db92nJR1xZAFcvaMLDLTmGTNW0dyaZ79cVFzw+62
        kdHrmhxntk8gn2NFiJJ7k+g5Qc/7P2a0Fz2ZWETjSbtXuirPdkYul6FuzKy4WDlTMWZEnE
        ia51HoWfR+5Le0LY6B2o155X3LxWUsI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-hvSfBgsJMbWUHyx-zqVP8w-1; Wed, 05 Jul 2023 05:07:50 -0400
X-MC-Unique: hvSfBgsJMbWUHyx-zqVP8w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31421c900b7so3098237f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jul 2023 02:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548069; x=1691140069;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qr/C5LtRvrDZoQId+bjsOh/ZaHhOujfRlisJ/yVhSwY=;
        b=j0AJJamdFl2o0iA3S2HlNlgOa+Y8iAsDMj2VqKIc76MzJjZKt1iAESv36C09VeE1qB
         6NZbIJpyiM2b2gxQumtA0hJVMXfa9ISZ8hWf3Z5Av35CjU3djQTGpNNliIMPFMxdxZH0
         T+/90XtnUcvUrgPB/AUTktLNZAE0rKVYl+7yBb/RhQl8xGGvHczjESUkzmxyWz1qCk+l
         4+DaT8fzIGi9OSw840aUVs7u22u5MKScYVC5zrwYzfKSMRNoCAuw44CPXT7mCrwTRt/Y
         iM4bZEjgMjCpIArL2slr4OdKR2CoPsry9BLgHeCBQvHcmhDvSIpz24YWz6tqJBH1G8JM
         T9AQ==
X-Gm-Message-State: ABy/qLaggGyYH1cAJc4cTQjj5GQCLyNZn6LNI0wSpuqfXmKNRIMYFeBD
        f4rQd8VSu8OJvwDS6ovjZyQ5iCHFDhFOSyQ2SA3KkwBB9Sr9LX8aH6jpqDlBf2Y07nfMhbyu537
        8RI6/tzfuaFiqH0Z0q+cFpwQ=
X-Received: by 2002:adf:f504:0:b0:30f:d12a:d0b5 with SMTP id q4-20020adff504000000b0030fd12ad0b5mr13084515wro.55.1688548069027;
        Wed, 05 Jul 2023 02:07:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHf2mlJzkynZeRnACKLZDj8dpbPaRQo1oHTkYMNq2t7OkGieb7M7VOESlbgxnGoXEMWu20AzQ==
X-Received: by 2002:adf:f504:0:b0:30f:d12a:d0b5 with SMTP id q4-20020adff504000000b0030fd12ad0b5mr13084501wro.55.1688548068811;
        Wed, 05 Jul 2023 02:07:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n5-20020adfe345000000b0030e5bd253aasm30417562wrj.39.2023.07.05.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 02:07:48 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 10/10] fbdev: Remove FB_DEFAULT_SYS_OPS
In-Reply-To: <20230704160133.20261-11-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-11-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 11:07:47 +0200
Message-ID: <87fs62rajg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove the initializer macro FB_DEFAULT_SYS_OPS and its helper macro
> __FB_DEFAULT_SYS_OPS_MMAP. There are no users.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de> (maintainer:FRAMEBUFFER LAYER)
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

