Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE78A4272A4
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Oct 2021 22:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242650AbhJHU5R (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Oct 2021 16:57:17 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55541 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231587AbhJHU5Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 8 Oct 2021 16:57:16 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id A9CF0580C13;
        Fri,  8 Oct 2021 16:55:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 08 Oct 2021 16:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
        :from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=U/0tI2WqpY8R/D5cCNUlc8nWhAl
        LsJXOzrctQujWspY=; b=l/83LD6l0rHvCZwTBsNAVmL0SqTO0/h8C5H2nz6CaE9
        md5NOYwRiHDc6jGDWDvKo0iR9nkIZSNGQEIjT8pR+5GYB9tddVnD9emmUQGwuHeg
        /XaeWspPz3GuFT/xqzFkTKAIDZCsdJU6v8uZ/47/ulLKqul5XLrF7kK6IF1uaNp6
        EvHsRJNO3E2y0TqoqAzBJE+YW16DN+aKXC7jFF0ybZUvzcCKzAcFt+eHdQnUKaU2
        W2YgPK5I2ERA1OQHY4EFj63/CfNVxsAz0e6vdb7aua/tm9u0rj2M2Bd3Z5NaA+TZ
        6UJUjBL1kIy2hE9BEPChzkjElPApG3xYKnLSSlRIe1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U/0tI2
        WqpY8R/D5cCNUlc8nWhAlLsJXOzrctQujWspY=; b=m2SDU6/GzFY7kNBWjel2k5
        QMEEP9MAC0CM9LfpyTHmTohPW33zwMfXCgy9jlfJuRot5mNKDUfluGt1Chnc7S56
        jBAE9SJ2A7OljpYYIbpisObs2KG3x2ppe/cQ6s8F+fk1a46k3RJ3gfRo3F56nQf0
        9y25aP8ii7jQlGiE19C/ich569t3faFmJxH8ht4VRUuDdLCMhUBPJUgE8j3ASqKD
        JKe+BaXKl7D8AsX+faKETfGglnuEzW8UY3BVgWnLH5+btZA5wccHDMHTdmIkoP6r
        /UuXeszP6MKZkEGiY1ezFuUB3vayyPXgDC4O1zqb4BsaKlwJKa5aXKMvZf4MOKWQ
        ==
X-ME-Sender: <xms:N7BgYRFnXQpksB119JM60EYoUp1HdvDkDoTj8GqluIHrunTIiMs9xA>
    <xme:N7BgYWVEAF48p_ub6G8kiOLvInPbQRxOQveFA40yTau8rXhuZc0PI4N7JCnysYuuN
    5GklthLaMCdonISFw>
X-ME-Received: <xmr:N7BgYTI1DN7JnUaNl4GIN1L0od1bEI4Lb8ivvXSmGNPh7y9W-OH-Pg9Qr9LkMibMGB6LetB3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttdejnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpedvjeeifeelhfetiefhhfdthfefke
    fhhfeutdetvdfgvefgveefheffgfekjeefheenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:OLBgYXH--C3B6cyF5MQe8RYpEULz7AsYHfXfb4nxT77sNhnXV1sFqg>
    <xmx:OLBgYXWgDRJjNqBOXiP9JxTR4PnQb05pTwdvIFS_dicO4cgnkYLOMA>
    <xmx:OLBgYSMMudCuWYDBs09GVSCVcETxBx0_XYMLA63OpFrtXz40j5t7Hw>
    <xmx:OLBgYXSdfmbw2Zr7_8ALlJODSWNZqACW47MJLKfrt32cPzHaIv6KdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 16:55:16 -0400 (EDT)
Date:   Fri, 8 Oct 2021 22:55:14 +0200
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 20/20] drm: cleanup: remove acquire_ctx from
 drm_mode_config
Message-ID: <YWCwMnHh09wOKwig@zacax395.localdomain>
References: <20211007193755.29579-1-greenfoo@u92.eu>
 <20211007193755.29579-21-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211007193755.29579-21-greenfoo@u92.eu>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/10/07 09:37PM, Fernando Ramos wrote:
> ---
>  include/drm/drm_mode_config.h | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 48b7de80daf5..b214b07157f2 100644
> 
This patch was missing the commit description and signed-off-by line. I'll fix
that for the next revision (v4) together with the rest of issues that might come
up.
