Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6A0767AD4C
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Jan 2023 10:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbjAYJGz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Jan 2023 04:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbjAYJGy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 04:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8936A3E0B9
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674637562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
        b=bb0cqsZz0zKgtjULylOvCA5zhjbhsiy7kCWvEcUDU7FIWespAcyAhvJgC8zanwc9H8Bokr
        f4b0p1VBuRFRAPXXm46sJuZTijcuJFCPcU3MzxWDQ4PsXEhYUuhwhPTkh29+LbjunbxIhA
        Sd56FNpXh7VUBBvmu21Gj7MRC8VoZ+A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-ovfcaegkMw2w3hV2wTJjrg-1; Wed, 25 Jan 2023 04:06:01 -0500
X-MC-Unique: ovfcaegkMw2w3hV2wTJjrg-1
Received: by mail-wm1-f70.google.com with SMTP id z22-20020a05600c0a1600b003db00dc4b69so767399wmp.5
        for <linux-tegra@vger.kernel.org>; Wed, 25 Jan 2023 01:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
        b=hIspydmyPRUSq54uiO92z4zRubeyX6Ym+TkN4oKxsBTvZ/+2EOctv+3OKF3k5YvbHw
         GxG1z+sA1yOjTOsLPW7HibSVfPcm55lW1T1u+A+wPreK+5Hngrn2/Weo5EUDfe4SZNNj
         trTEj2dwniiCHtZuXEM0rbnipLWwcn5w2PJa3hgVRP/19qOPAsiPsCHscpa81uwAwKiK
         97SdT1rYuV+MnEmeSpnymU+yCPw+8NlsPtnQCD0bf47UH588onPU38fr4Riqx/ERLMt2
         CAaI0yvOOdFWzdcZbe8a90c1fOp/9PzAlXiGsV4Xq6F8L4/elJd0oAxXoCWXBOFCjA3N
         D+Kg==
X-Gm-Message-State: AFqh2kqS+wwWDHIDlDCDWNndUvqoiW/Ve5ljzlFZoZ4c7OZEbkz1luot
        DNXAAIBx5yq7WpXB8krnsmRz7zePeuxadYRve6RAR5wkTnnna9la2noIbnGTUPqeiCSVtepXzXh
        zjGBL8eN40MXXiHkQ4u+Axm4=
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id n20-20020adfc614000000b00248ab8a5144mr21094647wrg.63.1674637559805;
        Wed, 25 Jan 2023 01:05:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMP+tIsLwCvIpxNk0o5l1ZP8xAGyOaXYfWMtnUqU1wHmPoAjbKjb1Za9A6b4DyRU3i/fPKxQ==
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id n20-20020adfc614000000b00248ab8a5144mr21094625wrg.63.1674637559560;
        Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d470f000000b002bc8130cca7sm3865503wrq.23.2023.01.25.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Message-ID: <a8beffd8-5977-aa51-97aa-feef314541e0@redhat.com>
Date:   Wed, 25 Jan 2023 10:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/10] drm/client: Add hotplug_failed flag
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-3-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Signal failed hotplugging with a flag in struct drm_client_dev. If set,
> the client helpers will not further try to set up the fbdev display.
> 
> This used to be signalled with a combination of cleared pointers in
> struct drm_fb_helper, which prevents us from initializing these pointers
> early after allocation.
> 
> The change also harmonizes behavior among DRM clients. Additional DRM
> clients will now handle failed hotplugging like fbdev does.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

