Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623BC747FB1
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jul 2023 10:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjGEIaI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jul 2023 04:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGEIaH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 04:30:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FF8C1;
        Wed,  5 Jul 2023 01:30:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C60561489;
        Wed,  5 Jul 2023 08:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F30C433C8;
        Wed,  5 Jul 2023 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688545805;
        bh=inI8/R9rjlpS8WoQRdgWwn9LNmLYX2ehc+aDS9lds/g=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=FqTP4LDEpnhDeEtkgK2BtMujf9EHlCs7NwLo/eNXIIgsOY2PG6mOxnnjPrFUvpgQQ
         YOzCplHIGTqKKKahnFTL+QHmmgFMC6vB4i24I+2chMd2X44j2aiZGTd+MieAx9MVOK
         vO3MEHxI/28PWNJC30gteb7nnWuouXlKpLt/BDBqTA3MEj4HDeMkqbfpp5jCx6tkQw
         iLjMB+I34PYLJqKsdmFvdWjvKSgNG7h120ozqVM6BcHlnZ8j/3jfafvQB39Yg+sZiK
         9LWp+kzAVHYfls5/YdXFMdZvpVcc/I+LJVWo5DkpRAYvuGMLhVXe+eMlUugYyeOpEZ
         ml13KW8lUnObQ==
Message-ID: <edd1978c81650a04eddc3ee144153fc2.mripard@kernel.org>
Date:   Wed, 05 Jul 2023 08:30:02 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH 00/10] drm: Improve fbdev emulation for DMA-able
 framebuffers
In-Reply-To: <20230704160133.20261-1-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, javierm@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 4 Jul 2023 17:49:57 +0200, Thomas Zimmermann wrote:
> Add fbdev helpers for framebuffers in DMA-able memory and update
> fbdev emulation in the respective DRM drivers. DMA memory used to
> handled as system memory. Improve this and prepare for possible
> future changes.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
