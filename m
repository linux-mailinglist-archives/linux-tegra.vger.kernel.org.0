Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0FD738D16
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Jun 2023 19:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjFURaP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 21 Jun 2023 13:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjFURaO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jun 2023 13:30:14 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23DCDD;
        Wed, 21 Jun 2023 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=CcrAj+Sil5cBMVcsMbx9etmraWtKjeOsT+7Pyy14Euw=; b=RBZaTUEqKllJ/kHRR1oQ8E6V7i
        W2F44C7alaPuSQ1buRGMmzWyOBXtqwdpFz4V6bGVL6k9Edc9yjrHUleMHPg0iqEjarLXLVR/w1I5h
        HQZJXLnSdMQBrAuUXS/F4cb552qvy7WPxMx3YjWzydRp0wp0Ifl02beDPauLTVHhSUG4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qC1em-00HAcZ-6q; Wed, 21 Jun 2023 19:30:12 +0200
Date:   Wed, 21 Jun 2023 19:30:12 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Revanth Kumar Uppala <ruppala@nvidia.com>
Cc:     hkallweit1@gmail.com, netdev@vger.kernel.org,
        linux-tegra@vger.kernel.org, Narayan Reddy <narayanr@nvidia.com>
Subject: Re: [PATCH] net: phy: Enhance fixed PHY to support 10G and 5G
Message-ID: <f6e20ec1-37a7-4aae-8c9b-3c82590678f6@lunn.ch>
References: <20230621165853.52273-1-ruppala@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621165853.52273-1-ruppala@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jun 21, 2023 at 10:28:53PM +0530, Revanth Kumar Uppala wrote:
> Add 10G and 5G speed entries for fixed PHY
> framework.These are needed for the platforms which
> doesn't have a PHY driver.
> 
> Signed-off-by: Revanth Kumar Uppala <ruppala@nvidia.com>
> Signed-off-by: Narayan Reddy <narayanr@nvidia.com>

This is the second time you have sent me this patch. You have failed
to answer the questions i asked you the last time.....

    Andrew

---
pw-bot: cr
